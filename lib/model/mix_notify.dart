import 'package:json_annotation/json_annotation.dart';
part 'mix_notify.g.dart';

// "id": 3,
// "title": "奖励已发送",
// "content": "签到奖励已发送，请到个人中心查看",
// "createTime": "2023-02-27T11:19:23.000+08:00",
// "status": 0,
// "sortNum": 3,
// "userIds": "-1",
// "readStatus": 0

@JsonSerializable()
class MixNotifyModel {

  String? id;
  String? title;
  String? content;
  String? createTime;
  num? status;
  num? sortNum;
  String? userIds;
  num? readStatus;
  String? jumpPath;


  MixNotifyModel(this.id, this.title, this.content, this.createTime,
      this.status, this.sortNum, this.userIds, this.readStatus, this.jumpPath);

  factory MixNotifyModel.fromJson(Map<String, dynamic> json) => _$MixNotifyModelFromJson(json);

  Map<String, dynamic> toJson() => _$MixNotifyModelToJson(this);
}

enum NotifyEnum {
  mix,
  reply,
  like,
}

extension NotifyExtension on NotifyEnum {
  String get cacheTag {
    switch (this) {
      case NotifyEnum.mix:
        return 'ArticleNotifyMix';
      case NotifyEnum.like:
        return 'ArticleNotifyLike';
      case NotifyEnum.reply:
        return 'ArticleNotifyReply';
    }
  }

  int get typeValue {
    switch (this) {
      case NotifyEnum.mix:
        return 1;
      case NotifyEnum.like:
        return 2;
      case NotifyEnum.reply:
        return 3;
    }
  }

}