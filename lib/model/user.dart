import 'dart:convert';
import 'package:fire_boot/services/app_http/account_service.dart';
import 'package:json_annotation/json_annotation.dart';
import 'anchor_infor.dart';
part 'user.g.dart';

/** 服务端那边是两张表，两张表合并为一个Model
    I/flutter (11246): ╔ Body
    I/flutter (11246): ║
    I/flutter (11246): ║    {
    I/flutter (11246): ║         code: 200,
    I/flutter (11246): ║         msg: null,
    I/flutter (11246): ║         data: {
    I/flutter (11246): ║             userInfor: {
    I/flutter (11246): ║                 id: 4,
    I/flutter (11246): ║                 noteSign: null,
    I/flutter (11246): ║                 userId: 5,
    I/flutter (11246): ║                 userCover: null,
    I/flutter (11246): ║                 wechatBindOpenId: null,
    I/flutter (11246): ║                 qqBindOpenId: null,
    I/flutter (11246): ║                 sinaBindOpenId: null,
    I/flutter (11246): ║                 appleBindOpenId: null,
    I/flutter (11246): ║                 sex: 3,
    I/flutter (11246): ║                 age: 0,
    I/flutter (11246): ║                 honorLevel: 0,
    I/flutter (11246): ║                 honorCore: 0.0,
    I/flutter (11246): ║                 email: "123456789@qq.com",
    I/flutter (11246): ║                 vipLevel: 0,
    I/flutter (11246): ║                 score: 0.0,
    I/flutter (11246): ║                 invitationCode: null,
    I/flutter (11246): ║                 userVipLostTime: null
    I/flutter (11246): ║            }
    I/flutter (11246): ║             user: {
    I/flutter (11246): ║                 id: 5,
    I/flutter (11246): ║                 phone: "18776964416",
    I/flutter (11246): ║                 nickName: "187****4416",
    I/flutter (11246): ║                 isAuthAnchor: 1,
    I/flutter (11246): ║                 status: 0,
    I/flutter (11246): ║                 createTime: "2023-02-03T16:11:19.000+08:00",
    I/flutter (11246): ║                 loginTime: null,
    I/flutter (11246): ║                 goldBalance: 0.0,
    I/flutter (11246): ║                 commentStatus: 0,
    I/flutter (11246): ║                 forumStatus: 0,
    I/flutter (11246): ║                 videoStatus: 0
    I/flutter (11246): ║            }
    I/flutter (11246): ║             fans: 0,
    I/flutter (11246): ║             attention: 0
    I/flutter (11246): ║        }
    I/flutter (11246): ║    }
    I/flutter (11246): ║
    I/flutter (11246): ╚══════════════════════════════════════════════════════════════════════════════════════════╝
 */

@JsonSerializable()
class User {

  String? id;
  String? noteSign;
  String? userId;
  String? userCover;
  num? wechatBindOpenId;
  num? qqBindOpenId;
  num? sinaBindOpenId;
  num? appleBindOpenId;
  num? sex;
  num? age;
  /// 荣誉登记
  num? honorLevel;
  /// 荣誉经验
  num? honorCore;
  /// 荣誉登记升级所需
  num? nextCore;
  String? nickName;
  num? followCount;
  num? videoCollection;
  num? loveCount;
  String? phone;
  /// 是否认证主播，预测号(0:是，1：否)
  num? isAuthAnchor;
  String? token;

  num? status;
  String? createTime;
  String? loginTime;
  /// 金币
  num? goldBalance;
  num? commentStatus;
  num? forumStatus;
  num? videoStatus;
  String? email;
  int? vipLevel;
  double? score;
  String? invitationCode;
  String? userVipLostTime;
  /// 粉丝数
  num? fans;
  /// 关注数
  num? attention;
  AnchorInfor? anchorInforResponseBody;
  /// 是否注销，(0:正常  1:已注销)
  num? outDelete;
  /// 是否互相关注，（0：没有 1：互相关注）
  num? isCrossRelations;
  /// 0:已关注，1：未关注
  num? userFollow;
  /// 最新方案发布时间
  String? newestProgramme;
  /// 是否领取邀请奖励
  num? isGetCoupon;
  /// 0未签到 1已签到
  num? todaySignin;
  /// 用户佩戴的徽章，json字符串
  String? userBage;
  /// null不是会员    1年费会员   2包月会员
  num? vipDateType;
  /// 卡劵数量
  String? couponCount;
  /// 预测卡数量
  num? forecastCardCount;


  User({
      this.id,
      this.noteSign,
      this.userId,
      this.userCover,
      this.wechatBindOpenId,
      this.qqBindOpenId,
      this.sinaBindOpenId,
      this.appleBindOpenId,
      this.sex,
      this.age,
      this.honorLevel,
      this.honorCore,
      this.nickName,
      this.followCount,
      this.videoCollection,
      this.loveCount,
      this.phone,
      this.isAuthAnchor,
      this.token,
      this.status,
      this.createTime,
      this.loginTime,
      this.goldBalance,
      this.commentStatus,
      this.forumStatus,
      this.videoStatus,
      this.email,
      this.vipLevel,
      this.score,
      this.invitationCode,
      this.userVipLostTime,
      this.fans,
      this.attention,
      this.anchorInforResponseBody,
      this.outDelete,
      this.isCrossRelations,
      this.userFollow,
      this.newestProgramme,
      this.isGetCoupon,
      this.todaySignin,
      this.userBage,
      this.vipDateType,
      this.couponCount,
      this.forecastCardCount,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{id: $id, noteSign: $noteSign, userId: $userId, userCover: $userCover, wechatBindOpenId: $wechatBindOpenId, qqBindOpenId: $qqBindOpenId, sinaBindOpenId: $sinaBindOpenId, appleBindOpenId: $appleBindOpenId, sex: $sex, age: $age, honorLevel: $honorLevel, honorCore: $honorCore, nextCore: $nextCore, nickName: $nickName, followCount: $followCount, videoCollection: $videoCollection, loveCount: $loveCount, phone: $phone, isAuthAnchor: $isAuthAnchor, token: $token, status: $status, createTime: $createTime, loginTime: $loginTime, goldBalance: $goldBalance, commentStatus: $commentStatus, forumStatus: $forumStatus, videoStatus: $videoStatus, email: $email, vipLevel: $vipLevel, score: $score, invitationCode: $invitationCode, userVipLostTime: $userVipLostTime, fans: $fans, attention: $attention, anchorInforResponseBody: $anchorInforResponseBody, outDelete: $outDelete, isCrossRelations: $isCrossRelations, userFollow: $userFollow, newestProgramme: $newestProgramme, isGetCoupon: $isGetCoupon, todaySignin: $todaySignin, userBage: $userBage, vipDateType: $vipDateType}';
  }

  UserBadge? getUserBadge() {
    String? userBage = AccountService.sharedInstance.currentUser?.userBage;
    if(userBage == null) {
      return null;
    }
    try {
      Map<String, dynamic> jsonMap = json.decode(userBage);
      UserBadge userBadge = UserBadge.fromJson(jsonMap);
      return userBadge;
    } catch (e) {
      print("徽章数据结构解析异常：$e");
      return null;
    }
  }

}

@JsonSerializable()
class UserBadge {

  String? id;
  String? type;
  String? name;
  num? fansLevel;
  String? bageNetUrl;
  String? anchorInforId;

  UserBadge({
    this.id,
    this.type,
    this.name,
    this.fansLevel,
    this.bageNetUrl,
    this.anchorInforId,
  });

  factory UserBadge.fromJson(Map<String, dynamic> json) => _$UserBadgeFromJson(json);

  Map<String, dynamic> toJson() => _$UserBadgeToJson(this);

}