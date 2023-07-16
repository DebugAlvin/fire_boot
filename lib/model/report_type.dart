import 'package:json_annotation/json_annotation.dart';
part 'report_type.g.dart';

enum ReportEnum {
  article,
  articleComment,
  video,
  videoComment,
  liveRoom,
  app,
}

@JsonSerializable()
class ReportTypeModel {

  num id;
  String? content;
  num status;
  num type;
  String? createTime;
  num sortNum;
  String? tag;
  List<String>? tags;

  ReportTypeModel(this.id, this.content, this.status, this.type,
      this.createTime, this.sortNum, this.tag, this.tags);

  factory ReportTypeModel.fromJson(Map<String, dynamic> json) => _$ReportTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportTypeModelToJson(this);
}