// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anchor_infor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnchorInfor _$AnchorInforFromJson(Map<String, dynamic> json) => AnchorInfor(
      id: json['id'],
      userId: json['userId'],
      phone: json['phone'],
      realName: json['realName'],
      personCode: json['personCode'],
      createTime: json['createTime'],
      status: json['status'],
      reason: json['reason'],
      tagTitle: json['tagTitle'],
      balance: json['balance'],
      giftDivide: json['giftDivide'] as num?,
      level: json['level'],
      freezeBalance: json['freezeBalance'],
      moneyPassword: json['moneyPassword'],
      forecastDivide: json['forecastDivide'] as num?,
      openStatus: json['openStatus'],
      closeTime: json['closeTime'],
      appUserBankList: (json['appUserBankList'] as List<dynamic>?)
          ?.map((e) => UserBank.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnchorInforToJson(AnchorInfor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'phone': instance.phone,
      'realName': instance.realName,
      'personCode': instance.personCode,
      'createTime': instance.createTime,
      'status': instance.status,
      'reason': instance.reason,
      'tagTitle': instance.tagTitle,
      'balance': instance.balance,
      'level': instance.level,
      'freezeBalance': instance.freezeBalance,
      'moneyPassword': instance.moneyPassword,
      'openStatus': instance.openStatus,
      'closeTime': instance.closeTime,
      'forecastDivide': instance.forecastDivide,
      'giftDivide': instance.giftDivide,
      'appUserBankList': instance.appUserBankList,
    };
