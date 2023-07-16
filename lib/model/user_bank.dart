
import 'package:json_annotation/json_annotation.dart';

part 'user_bank.g.dart';

@JsonSerializable()
class UserBank {

  String? id;
  String? userId;
  num? bankType;
  String? bankAccount;
  dynamic qrCode;
  String? createTime;
  String? updateTime;
  num? isDelete;
  String? bankOpenAddress;
  String? bankMobile;
  /// 审核状态,0:待审核，1：审核中，2：审核通过，3：审核失败
  num? bankStatus;

  UserBank({
      this.id,
      this.userId,
      this.bankType,
      this.bankAccount,
      this.qrCode,
      this.createTime,
      this.updateTime,
      this.isDelete,
      this.bankOpenAddress,
      this.bankMobile,
      this.bankStatus
  });

  factory UserBank.fromJson(Map<String, dynamic> json) => _$UserBankFromJson(json);

  Map<String, dynamic> toJson() => _$UserBankToJson(this);


}