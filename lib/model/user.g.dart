// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      noteSign: json['noteSign'] as String?,
      userId: json['userId'] as String?,
      userCover: json['userCover'] as String?,
      wechatBindOpenId: json['wechatBindOpenId'] as num?,
      qqBindOpenId: json['qqBindOpenId'] as num?,
      sinaBindOpenId: json['sinaBindOpenId'] as num?,
      appleBindOpenId: json['appleBindOpenId'] as num?,
      sex: json['sex'] as num?,
      age: json['age'] as num?,
      honorLevel: json['honorLevel'] as num?,
      honorCore: json['honorCore'] as num?,
      nickName: json['nickName'] as String?,
      followCount: json['followCount'] as num?,
      videoCollection: json['videoCollection'] as num?,
      loveCount: json['loveCount'] as num?,
      phone: json['phone'] as String?,
      isAuthAnchor: json['isAuthAnchor'] as num?,
      token: json['token'] as String?,
      status: json['status'] as num?,
      createTime: json['createTime'] as String?,
      loginTime: json['loginTime'] as String?,
      goldBalance: json['goldBalance'] as num?,
      commentStatus: json['commentStatus'] as num?,
      forumStatus: json['forumStatus'] as num?,
      videoStatus: json['videoStatus'] as num?,
      email: json['email'] as String?,
      vipLevel: json['vipLevel'] as int?,
      score: (json['score'] as num?)?.toDouble(),
      invitationCode: json['invitationCode'] as String?,
      userVipLostTime: json['userVipLostTime'] as String?,
      fans: json['fans'] as num?,
      attention: json['attention'] as num?,
      anchorInforResponseBody: json['anchorInforResponseBody'] == null
          ? null
          : AnchorInfor.fromJson(
              json['anchorInforResponseBody'] as Map<String, dynamic>),
      outDelete: json['outDelete'] as num?,
      isCrossRelations: json['isCrossRelations'] as num?,
      userFollow: json['userFollow'] as num?,
      newestProgramme: json['newestProgramme'] as String?,
      isGetCoupon: json['isGetCoupon'] as num?,
      todaySignin: json['todaySignin'] as num?,
      userBage: json['userBage'] as String?,
      vipDateType: json['vipDateType'] as num?,
      couponCount: json['couponCount'] as String?,
      forecastCardCount: json['forecastCardCount'] as num?,
    )..nextCore = json['nextCore'] as num?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'noteSign': instance.noteSign,
      'userId': instance.userId,
      'userCover': instance.userCover,
      'wechatBindOpenId': instance.wechatBindOpenId,
      'qqBindOpenId': instance.qqBindOpenId,
      'sinaBindOpenId': instance.sinaBindOpenId,
      'appleBindOpenId': instance.appleBindOpenId,
      'sex': instance.sex,
      'age': instance.age,
      'honorLevel': instance.honorLevel,
      'honorCore': instance.honorCore,
      'nextCore': instance.nextCore,
      'nickName': instance.nickName,
      'followCount': instance.followCount,
      'videoCollection': instance.videoCollection,
      'loveCount': instance.loveCount,
      'phone': instance.phone,
      'isAuthAnchor': instance.isAuthAnchor,
      'token': instance.token,
      'status': instance.status,
      'createTime': instance.createTime,
      'loginTime': instance.loginTime,
      'goldBalance': instance.goldBalance,
      'commentStatus': instance.commentStatus,
      'forumStatus': instance.forumStatus,
      'videoStatus': instance.videoStatus,
      'email': instance.email,
      'vipLevel': instance.vipLevel,
      'score': instance.score,
      'invitationCode': instance.invitationCode,
      'userVipLostTime': instance.userVipLostTime,
      'fans': instance.fans,
      'attention': instance.attention,
      'anchorInforResponseBody': instance.anchorInforResponseBody,
      'outDelete': instance.outDelete,
      'isCrossRelations': instance.isCrossRelations,
      'userFollow': instance.userFollow,
      'newestProgramme': instance.newestProgramme,
      'isGetCoupon': instance.isGetCoupon,
      'todaySignin': instance.todaySignin,
      'userBage': instance.userBage,
      'vipDateType': instance.vipDateType,
      'couponCount': instance.couponCount,
      'forecastCardCount': instance.forecastCardCount,
    };

UserBadge _$UserBadgeFromJson(Map<String, dynamic> json) => UserBadge(
      id: json['id'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      fansLevel: json['fansLevel'] as num?,
      bageNetUrl: json['bageNetUrl'] as String?,
      anchorInforId: json['anchorInforId'] as String?,
    );

Map<String, dynamic> _$UserBadgeToJson(UserBadge instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'fansLevel': instance.fansLevel,
      'bageNetUrl': instance.bageNetUrl,
      'anchorInforId': instance.anchorInforId,
    };
