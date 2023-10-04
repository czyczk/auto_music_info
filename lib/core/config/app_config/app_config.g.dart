// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
      title: json['title'] as String,
      serverEndpoint: json['serverEndpoint'] as String,
      useDummyData: json['useDummyData'] as bool?,
    );

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'title': instance.title,
      'serverEndpoint': instance.serverEndpoint,
      'useDummyData': instance.useDummyData,
    };
