import 'package:auto_music_info/core/common/utils/id_util.dart';
import 'package:auto_music_info/module/search_session_carousel/models/search_session_model.dart';
import 'package:auto_music_info/module/search_session_carousel/widgets/screens/search_session_carousel.dart';
import 'package:flutter/material.dart';

class SearchScene extends StatefulWidget {
  const SearchScene({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchSceneState();
}

class _SearchSceneState extends State<SearchScene>
    with AutomaticKeepAliveClientMixin<SearchScene> {
  final SearchSession _searchSession =
      SearchSession(sessionId: generateLongId());

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SearchSessionCarousel.ofExistingSession(
        searchSession: _searchSession);
  }
}
