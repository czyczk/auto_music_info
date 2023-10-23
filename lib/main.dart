import 'package:auto_music_info/core/config/color_scheme/app_theme.dart';
import 'package:auto_music_info/core/providers/ami_service/history_service.dart';
import 'package:auto_music_info/core/providers/ami_service/impl/dummy_history_service_impl.dart';
import 'package:auto_music_info/core/providers/ami_service/impl/dummy_search_service_impl.dart';
import 'package:auto_music_info/core/providers/ami_service/impl/dummy_text_checker_service_impl.dart';
import 'package:auto_music_info/core/providers/ami_service/impl/history_service_impl.dart';
import 'package:auto_music_info/core/providers/ami_service/impl/search_service_impl.dart';
import 'package:auto_music_info/core/providers/ami_service/impl/text_checker_service_impl.dart';
import 'package:auto_music_info/core/providers/ami_service/search_service.dart';
import 'package:auto_music_info/core/providers/ami_service/text_checker_service.dart';
import 'package:auto_music_info/module/scene_manager_scaffold/widgets/scene_manager_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/config/app_config/app_config.dart';
import 'core/config/app_config/app_config_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Music Info',
      theme: ThemeData(
        colorScheme: AppTheme.lightColorScheme,
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Auto Music Info'),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadAppConfig(),
        builder: (BuildContext context, AsyncSnapshot<AppConfig> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            // App config and providers
            AppConfig appConfig = snapshot.data!;
            final useDummyData = appConfig.useDummyData ?? false;
            SearchService searchService = useDummyData
                ? DummySearchServiceImpl()
                : SearchServiceImpl(appConfig: appConfig);
            HistoryService historyService = useDummyData
                ? DummyHistoryServiceImpl(searchService)
                : HistoryServiceImpl();
            TextCheckerService textCheckerService = useDummyData
                ? DummyTextCheckerServiceImpl()
                : TextCheckerServiceImpl(appConfig: appConfig);

            return MultiProvider(providers: [
              Provider(create: (_) => appConfig),
              ChangeNotifierProvider(create: (_) => searchService),
              ChangeNotifierProvider(create: (_) => historyService),
              ChangeNotifierProvider(create: (_) => textCheckerService),
            ], child: const SceneManagerScaffold());
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
