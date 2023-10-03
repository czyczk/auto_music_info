import 'package:auto_music_info/core/providers/ami_service/history_service.dart';
import 'package:auto_music_info/core/providers/ami_service/models/history_digest_entry.dart';
import 'package:auto_music_info/module/common/widgets/dash_divider.dart';
import 'package:auto_music_info/module/search_history_carousel/screens/search_history_dummy_session.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchHistoryPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const SearchHistoryPage({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    HistoryService historyService = Provider.of<HistoryService>(context);

    return FutureBuilder(
      future: historyService.getHistoryDigestEntries(),
      builder: (BuildContext context,
          AsyncSnapshot<List<HistoryDigestEntry>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return ListView.separated(
            itemCount: 5,
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: DashDivider(
                  height: 1,
                  color: Colors.grey.withOpacity(0.3),
                ),
              );
            },
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index].query),
                subtitle: Text(snapshot.data![index].updateTime.toString()),
                onTap: () => {
                  navigatorKey.currentState!.push(MaterialPageRoute(
                    builder: (context) => const SearchHistoryDummySession(),
                  ))
                },
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
