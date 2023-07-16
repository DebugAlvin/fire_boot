import 'dart:convert';

class PageModel<T> {
  ///当前页数
  int curPage = 0;

  ///数据
  List<T> content;

  ///偏移
  int offset = 0;

  ///第一页
  bool first = true;

  ///是否为最后一页
  bool over = false;

  ///页数长度
  int pageCount = 0;

  ///当前页大小
  int size = 0;

  ///数据总大小
  int total = 0;

  PageModel({
    required this.curPage,
    required this.content,
    required this.offset,
    required this.over,
    required this.pageCount,
    required this.size,
    required this.total,
    required this.first,
  });

  factory PageModel.fromJson(
    Map<String, dynamic>? json,
    T Function(dynamic json) fromJsonT,
  ) =>
      json == null ? $ApiResultZero() : _$ApiResultFromJson(json!, fromJsonT);
}

PageModel<T> _$ApiResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  List<T> content = [];
  final list = json["rows"];
  if (list != null && (list is List) && list.isNotEmpty) {
    for (var obj in list) {
      final model = _$nullableGenericFromJson(obj, fromJsonT);
      if (model != null) {
        content.add(model!);
      }
    }
  }

  // if(content.isEmpty) return $ApiResultZero();

  /// "total": 4,
  /// "pageSize": 4,
  /// "nowPage": 1,
  /// "totalPage": 1,
  return PageModel<T>(
    curPage: json["nowPage"] ?? 0,
    content: content,
    offset: 0,
    over: ((json["nowPage"] == json["totalPage"]) || json["totalPage"] == 0) ? true : false,
    pageCount: json["pageSize"] ?? 0,
    size: json["pageSize"] ?? 0,
    total: json["total"] ?? 0,
    first: json["nowPage"] == 1 ? true : false,
  );
}

PageModel<T> $ApiResultZero<T>() {
  return PageModel<T>(
      curPage: 1,
      content: [],
      offset: 0,
      over: true,
      pageCount: 0,
      size: 0,
      total: 0,
      first: true);
}

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
