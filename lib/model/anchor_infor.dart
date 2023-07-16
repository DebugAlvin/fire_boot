
import 'package:fire_boot/model/user_bank.dart';
import 'package:json_annotation/json_annotation.dart';


part 'anchor_infor.g.dart';


@JsonSerializable()
class AnchorInfor {

  dynamic id;
  dynamic userId;
  dynamic phone;
  dynamic realName;
  dynamic personCode;
  dynamic createTime;
  /// 状态,0:认证成功，1：认证中,2:认证失败
  dynamic status;
  dynamic reason;
  dynamic tagTitle;
  dynamic balance;
  dynamic level;
  dynamic freezeBalance;
  dynamic moneyPassword;
  dynamic openStatus;
  dynamic closeTime;
  /// 发布方案，扣除手续费的比率，例收到0.1 (1-0.1=0.9)手续费90%
  num? forecastDivide;
  /// 收到礼物，扣除手续费的比率，例收到0.1 (1-0.1=0.9)手续费90%
  num? giftDivide;
  List<UserBank>? appUserBankList;

  AnchorInfor({
      this.id,
      this.userId,
      this.phone,
      this.realName,
      this.personCode,
      this.createTime,
      this.status,
      this.reason,
      this.tagTitle,
      this.balance,
      this.giftDivide,
      this.level,
      this.freezeBalance,
      this.moneyPassword,
      this.forecastDivide,
      this.openStatus,
      this.closeTime,
      this.appUserBankList
  });

  factory AnchorInfor.fromJson(Map<String, dynamic> json) => _$AnchorInforFromJson(json);

  Map<String, dynamic> toJson() => _$AnchorInforToJson(this);

  @override
  String toString() {
    return 'AnchorInfor{id: $id, userId: $userId, phone: $phone, realName: $realName, personCode: $personCode, createTime: $createTime, status: $status, reason: $reason, tagTitle: $tagTitle, balance: $balance, giftDivide: $giftDivide, level: $level, freezeBalance: $freezeBalance, moneyPassword: $moneyPassword, forecastDivide: $forecastDivide, openStatus: $openStatus, closeTime: $closeTime, appUserBankList: $appUserBankList}';
  }
}