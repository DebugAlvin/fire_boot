// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportTypeModel _$ReportTypeModelFromJson(Map<String, dynamic> json) =>
    ReportTypeModel(
      json['id'] as num,
      json['content'] as String?,
      json['status'] as num,
      json['type'] as num,
      json['createTime'] as String?,
      json['sortNum'] as num,
      json['tag'] as String?,
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ReportTypeModelToJson(ReportTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'status': instance.status,
      'type': instance.type,
      'createTime': instance.createTime,
      'sortNum': instance.sortNum,
      'tag': instance.tag,
      'tags': instance.tags,
    };
