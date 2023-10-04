import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable()
class AppConfig {
  late final String title;
  late final String serverEndpoint;
  late final bool? useDummyData;

  AppConfig(
      {required this.title,
      required this.serverEndpoint,
      required this.useDummyData});

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigToJson(this);
}
