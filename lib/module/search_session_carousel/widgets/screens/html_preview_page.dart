import 'dart:math' as math;

import 'package:auto_music_info/module/common/widgets/ami_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlPreviewPage extends StatefulWidget {
  final String htmlDoc;

  const HtmlPreviewPage({super.key, required this.htmlDoc});

  @override
  State<HtmlPreviewPage> createState() => _HtmlPreviewPageState();
}

class _HtmlPreviewPageState extends State<HtmlPreviewPage> {
  bool showSource = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 6.0,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'HTML Preview',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const AmiTextStyle(child: Text('View Source')),
                      // Make the switch a bit smaller using Transform.scale
                      Transform.scale(
                        scale: 0.85,
                        child: Switch(
                          value: showSource,
                          onChanged: (v) => setState(() => showSource = v),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: showSource
                    ? _buildSourceView()
                    : AmiTextStyle(child: HtmlWidget(widget.htmlDoc)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSourceView() {
    final formatted = _formatHtml(widget.htmlDoc);
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        child: SelectableText(
          formatted,
          style: const TextStyle(fontFamily: 'monospace', fontSize: 14.0),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  /// A small, forgiving HTML formatter that adds newlines and indentation
  /// to make raw HTML more readable. It's not a full parser but handles
  /// common tag structures and self-closing tags.
  String _formatHtml(String html) {
    if (html.trim().isEmpty) return '';

    final tagOrText = RegExp(r'<[^>]+>|[^<]+');
    final selfClosingTags = <String>{
      'br',
      'img',
      'hr',
      'input',
      'meta',
      'link',
      'source',
      'track',
      'area',
      'base',
      'col',
      'embed',
      'param',
      'wbr',
    };

    final out = StringBuffer();
    int indent = 0;

    for (final m in tagOrText.allMatches(html)) {
      final token = m.group(0) ?? '';
      if (token.startsWith('<')) {
        final lower = token.toLowerCase();
        final isComment = lower.startsWith('<!--');
        final isDoctype =
            lower.startsWith('<!doctype') || lower.startsWith('<!doctype');
        final isDeclaration =
            lower.startsWith('<!') && !isComment && !isDoctype;

        if (lower.startsWith('</')) {
          // closing tag -> dedent then print
          indent = math.max(0, indent - 1);
          out.writeln('${'  ' * indent}${token.trim()}');
        } else if (isComment || isDoctype || isDeclaration) {
          // comments and declarations stay at current indent
          out.writeln('${'  ' * indent}${token.trim()}');
        } else {
          // opening or self-closing tag
          // detect tag name
          final nameMatch = RegExp(r'^<\s*([a-z0-9:-]+)').firstMatch(lower);
          final tagName = nameMatch?.group(1) ?? '';
          final isSelfClosing =
              token.endsWith('/>') || selfClosingTags.contains(tagName);

          out.writeln('${'  ' * indent}${token.trim()}');

          if (!isSelfClosing) {
            indent++;
          }
        }
      } else {
        // text node
        final text = token.replaceAll(RegExp(r'\s+'), ' ').trim();
        if (text.isNotEmpty) {
          out.writeln('${'  ' * indent}${text}');
        }
      }
    }

    return out.toString();
  }
}
