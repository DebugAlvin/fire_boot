// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBank _$UserBankFromJson(Map<String, dynamic> json) => UserBank(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      bankType: json['bankType'] as num?,
      bankAccount: json['bankAccount'] as String?,
      qrCode: json['qrCode'],
      createTime: json['createTime'] as String?,
      updateTime: json['updateTime'] as String?,
      isDelete: json['isDelete'] as num?,
      bankOpenAddress: json['bankOpenAddress'] as String?,
      bankMobile: json['bankMobile'] as String?,
      bankStatus: json['bankStatus'] as num?,
    );

Map<String, dynamic> _$UserBankToJson(UserBank instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bankType': instance.bankType,
      'bankAccount': instance.bankAccount,
      'qrCode': instance.qrCode,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'isDelete': instance.isDelete,
      'bankOpenAddress': instance.bankOpenAddress,
      'bankMobile': instance.bankMobile,
      'bankStatus': instance.bankStatus,
    };
