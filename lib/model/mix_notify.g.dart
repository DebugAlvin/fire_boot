// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mix_notify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MixNotifyModel _$MixNotifyModelFromJson(Map<String, dynamic> json) =>
    MixNotifyModel(
      json['id'] as String?,
      json['title'] as String?,
      json['content'] as String?,
      json['createTime'] as String?,
      json['status'] as num?,
      json['sortNum'] as num?,
      json['userIds'] as String?,
      json['readStatus'] as num?,
      json['jumpPath'] as String?,
    );

Map<String, dynamic> _$MixNotifyModelToJson(MixNotifyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createTime': instance.createTime,
      'status': instance.status,
      'sortNum': instance.sortNum,
      'userIds': instance.userIds,
      'readStatus': instance.readStatus,
      'jumpPath': instance.jumpPath,
    };
