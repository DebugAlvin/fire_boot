import 'package:json_annotation/json_annotation.dart';
part 'temp_im_token.g.dart';

@JsonSerializable()
class TempImTokenModel {
  String token;
  String userId;

  TempImTokenModel(this.token, this.userId);

  factory TempImTokenModel.fromJson(Map<String, dynamic> json) => _$TempImTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TempImTokenModelToJson(this);
}