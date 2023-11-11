import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/core/providers/ami_service/models/search_results.dart';
import 'package:auto_music_info/core/providers/ami_service/models/text_language_enum.dart';
import 'package:auto_music_info/core/providers/ami_service/models/text_validity_result.dart';
import 'package:auto_music_info/core/providers/ami_service/search_service.dart';
import 'package:auto_music_info/core/providers/ami_service/text_checker_service.dart';
import 'package:auto_music_info/module/common/widgets/popup_dialog.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SearchSessionKeywordPage extends StatefulWidget {
  const SearchSessionKeywordPage({
    Key? key,
    required this.searchSession,
    required this.updateActivePageFunc,
  }) : super(key: key);

  final SearchSession searchSession;

  final Function updateActivePageFunc;

  @override
  State<StatefulWidget> createState() => _SearchSessionKeywordPage();
}

class _SearchSessionKeywordPage extends State<SearchSessionKeywordPage> {
  final keywordTextController = TextEditingController();
  final keySearchButton = GlobalKey();
  final keyboardListenerFocusNode = FocusNode();
  final textFieldFocusNode = FocusNode();

  // Debounce
  bool isDebouncing = false;

  @override
  void initState() {
    super.initState();
    _ensureFocus();
  }

  @override
  void dispose() {
    keywordTextController.dispose();
    keyboardListenerFocusNode.dispose();
    textFieldFocusNode.dispose();
    super.dispose();
  }

  void _ensureFocus() {
    textFieldFocusNode.canRequestFocus = true;
    textFieldFocusNode.requestFocus();
  }

  Future<void> _submitKeyword(
    SearchService searchService,
    TextCheckerService textCheckerService,
    ScaffoldMessengerState scaffoldMessengerState,
  ) async {
    // Debounce
    if (isDebouncing) {
      return;
    }

    setState(() {
      isDebouncing = true;
    });

    final enteredKeyword = keywordTextController.text;
    if (kDebugMode) {
      print('enteredKeyword: $enteredKeyword');
    }

    try {
      if (enteredKeyword.isEmpty) {
        return;
      }

      // Check text validity
      // TextLanguage: todo
      TextValidityResult textValidityResult =
          await textCheckerService.checkTextValidity(
              keywordTextController.text, TextLanguageEnum.notSpecified);
      if (!textValidityResult.isValid) {
        bool shouldContinue = await _showPopupDialogOnInvalidTextCheckerResult(
            textValidityResult);
        if (!shouldContinue) {
          return;
        }
      }

      // Search
      SearchResults searchResults =
          await searchService.searchWithKeyword(enteredKeyword);

      setState(() {
        // Push forward after a successful search.
        // Update session info.
        widget.searchSession.phaseKeywordInfo.query = enteredKeyword;
        widget.searchSession.activePhase =
            SearchSessionPhaseEnum.phaseSearchResults;
        widget.searchSession.sessionUpdateTime = DateTime.now();
        // Set the best phase to phaseSearchResults even if there are further phases before.
        // Any further phases will be not accessible.
        widget.searchSession.bestPhase =
            SearchSessionPhaseEnum.phaseSearchResults;
        widget.searchSession.phaseSearchResultsInfo =
            SearchSessionPhaseSearchResultsInfo.ofResults(
                query: searchResults.query,
                correctedQuery: searchResults.correctedQuery,
                searchResultsMap: searchResults.resultMap);
      });
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      scaffoldMessengerState.showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          content: Text('Failed to search: ${e.toString()}'),
        ),
      );
    } finally {
      setState(() {
        widget.updateActivePageFunc(widget.searchSession.activePhase.index);
        isDebouncing = false;
      });

      _ensureFocus();
    }
  }

  Future<bool> _showPopupDialogOnInvalidTextCheckerResult(
    TextValidityResult textValidityResult,
  ) async {
    bool? shouldContinue = await showAdaptiveDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return PopupDialog(
            title: 'Possible unwanted character found',
            message: 'Invalid char: ${textValidityResult.invalidChar}\n'
                'Code point: 0x${textValidityResult.invalidChar!.codeUnits.first.toRadixString(16)}\n'
                'Reason: ${textValidityResult.invalidReason}',
            onOk: () => Navigator.of(context).pop(true),
            onCancel: () => Navigator.of(context).pop(false),
            okText: 'Proceed',
          );
        });

    if (kDebugMode) {
      print('shouldContinue: $shouldContinue');
    }
    return shouldContinue == true;
  }

  @override
  Widget build(BuildContext context) {
    SearchService searchService = Provider.of<SearchService>(context);
    TextCheckerService textCheckerService =
        Provider.of<TextCheckerService>(context);

    if (keywordTextController.text.isEmpty) {
      keywordTextController.text = widget.searchSession.phaseKeywordInfo.query;
    }

    return Container(
        color: Color.lerp(
            context.theme.colorSchemeExtended.background, Colors.white, 0.42),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            padding: const EdgeInsets.only(bottom: 32),
            child: Image.asset(
              'assets/logos/ami_logo.png',
              width: 450,
              fit: BoxFit.fitWidth,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 100, maxWidth: 600),
              child: RawKeyboardListener(
                focusNode: FocusNode(),
                onKey: (event) => {
                  if (event is RawKeyDownEvent &&
                      event.logicalKey == LogicalKeyboardKey.enter)
                    _submitKeyword(
                      searchService,
                      textCheckerService,
                      ScaffoldMessenger.of(context),
                    ),
                },
                child: TextField(
                  controller: keywordTextController,
                  focusNode: textFieldFocusNode,
                  enabled: !isDebouncing,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                    enabledBorder: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            context.theme.colorSchemeExtended.onPrimaryDisabled,
                      ),
                    ),
                    hintText: 'Enter keyword to search',
                    hintStyle: TextStyle(
                      color: context.theme.colorSchemeExtended.onBackground,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: IconButton(
                key: keySearchButton,
                icon: const Icon(
                  Icons.search,
                  size: 28,
                ),
                onPressed: () => _submitKeyword(
                  searchService,
                  textCheckerService,
                  ScaffoldMessenger.of(context),
                ),
              ),
            )
          ]),
          Text(widget.searchSession.activePhase.toString()),
          // A spacer to push the main content up a little.
          const SizedBox(
            height: 64,
          )
        ]));
  }
}
