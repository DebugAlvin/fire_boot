import 'dart:math';
import 'package:dio/dio.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/model/anchor_infor.dart';
import 'package:fire_boot/model/mix_notify.dart';
import 'package:fire_boot/model/page.dart';
import 'package:fire_boot/model/report_type.dart';
import 'package:fire_boot/model/user.dart';
import 'package:fire_boot/utils/http/http_config.dart';
import 'package:fire_boot/utils/http/http_engine.dart';
import 'package:fire_boot/utils/http/http_response.dart';
import 'package:fire_boot/utils/json_util.dart';
import 'package:fire_boot/utils/secret_util.dart';
import 'package:fire_boot/utils/sp_util.dart';
import 'package:flutter/material.dart';
import '../../constant/app_cache_key.dart';
import 'business_interceptor.dart';
import 'default_http_transformer.dart';

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class AppRequestService {
  late var $engine;

  static AppRequestService? _instance;

  static AppRequestService _getInstance() {
    _instance ??= AppRequestService();
    return _instance!;
  }

  static AppRequestService get instance => _getInstance();

  AppRequestService() {
    String? proxy = SPUtil().get<String>(CacheKey.appProxy);
    if(proxy == null || proxy == "") {
      final config = HttpConfig(
        AppValues.baseUrl,
        interceptors: [BusinessInterceptor()],
        format: DefaultHttpTransformer(),
        connectTimeout: 15 * 1000,
      );
      $engine = HttpEngine.instance(config);
    } else {
      final config = HttpConfig(
          AppValues.baseUrl,
          interceptors: [BusinessInterceptor()],
          format: DefaultHttpTransformer(),
          connectTimeout: 15 * 1000,
          proxy: proxy
      );
      $engine = HttpEngine.instance(config);
    }
  }

  void setProxy({required String? proxy, VoidCallback? onSuccess, VoidCallback? onFail}) {
    try {
      HttpEngine.destroy();
      $engine = null;
      if(proxy == null || proxy == "") {
        final config = HttpConfig(
            AppValues.baseUrl,
            interceptors: [BusinessInterceptor()],
            format: DefaultHttpTransformer(),
            connectTimeout: 15 * 1000,
        );
        $engine = HttpEngine.instance(config);
      } else {
        final config = HttpConfig(
            AppValues.baseUrl,
            interceptors: [BusinessInterceptor()],
            format: DefaultHttpTransformer(),
            connectTimeout: 15 * 1000,
            proxy: proxy
        );
        $engine = HttpEngine.instance(config);
      }

      SPUtil().setString(CacheKey.appProxy, proxy!);
      if(onSuccess != null) {
        onSuccess();
      }
    } catch(e) {
      if(onFail != null) {
        onFail();
      }
    }
  }

  String? getProxy() {
    return $engine.getProxy();
  }

  List<T> getList<T>(
      dynamic data, T Function(Map<String, dynamic> json) fromJsonT) {
    return (data as List?)?.map((obj) => fromJsonT(obj)).toList() ?? [];
  }

  Future<HttpResponse> getLoginCode(
    String mobile, {
    required Success<String> success,
    required Fail fail,
  }) async {
    //签名方式,MD5(mobile.substring(5,mobile.length) + type + mobile + time + mobile)
    int subType = 5;
    //随机数字 = 123456
    int type = Random.secure().nextInt(100000);
    //phone按照subType截取，比如15212345678截取后=phonesub=345678
    String phoneSubStr = mobile.substring(subType, mobile.length);
    //当前时间戳
    int time = DateTime.now().millisecondsSinceEpoch;
    final signData = ["abc", "efg", "uui", "sddd"];
    final signArr = signData.join(",");
    //strSign = phonesub+type+phone+time+phone+signArr
    final strSign = '$phoneSubStr$type$mobile$time$mobile$signArr';
    //最后md5处理
    String nonstr = SecretUtil.hashMD5(strSign);
    //time = time + subType;
    //签名方式END
    // String path = "/user/getCode/$mobile/$type/$nonstr/$time";
    String path = '/getSms';
    // 最终提交请求参数为：
    // Phone:15212345678
    // Nonstr:3982de6ea1062aa94f5750293bb7691b
    // Time:10000005   值的计算方式(10000000+subType=10000005)
    // Type:123456
    var params = {
      'phone': mobile,
      // "platform": "app",
      // "pwd": "1234",
      'nonstr': nonstr,
      'time': time + subType,
      'type': type,
      // "invitation": "1234",
    };

    final response = await $engine.execute(Method.POST, path, data: params);
    if (response.ok) {
      if (response.statusCode == 200) {
        success('发送成功');
      } else if (response.statusCode == 500) {
        fail(response.statusCode ?? -1, response.msg);
      }
    } else {
      fail(response.error?.code ?? -1, response.error?.message ?? "服务器异常");
    }
    return response;
  }

  Future<HttpResponse> login(
    String mobile,
    String code, {
    required Success<String> success,
    required Fail fail,
  }) async {
    // "pwd": "123456",
    // "phone": "18033437504",
    // "msg": "111111",
    // "platform": "app",
    // "invitation": "88774455"
    var params = {
      "phone": mobile,
      // "platform": "app",
      // "pwd": "1234",
      "smsCode": code,
      // "invitation": "1234",
    };

    String path = "/loginSms";
    final response = await $engine.execute(Method.POST, path, data: params);
    if (response.ok) {
      if (response.statusCode == 200) {
        String token = response.data["access_token"];
        success(token);
      } else {
        fail(response.statusCode ?? -1, response.msg ?? "服务器异常");
      }
    } else {
      fail(response.error?.code ?? -1, response.error?.message ?? "服务器异常");
    }
    return response;
  }

  /// 生成带签名算法的http header
  Map<String, dynamic> generatorHeaderWithToken(String token) {
    int nowTime = DateTime.now().millisecondsSinceEpoch;
    int rdata = nowTime + Random().nextInt(1000000000);
    String nonstr = "";
    if (token != null && token.length > 100) {
      String newToken = token.substring(99);
      String newStr = "$rdata$newToken${nowTime + 1000}$token";
      final signData = ["abc", "efg", "uui", "sddd"];
      final signArr = "$newStr${signData.join(",")}";
      nonstr = SecretUtil.hashMD5(signArr);
    }

    return {
      'Authorization': token,
      'nonstr': nonstr,
      'nowtime': nowTime,
      'rdata': rdata,
    };
  }

  /// 拉取用户信息
  /// 只有该接口需要传token
  Future<HttpResponse> getUserInfo({
    required String token,
    required Success<User> success,
    required Fail fail,
  }) async {
    String path = "/api/user/getUserInfo";
    var params = {};
    HttpResponse response = await $engine.execute(Method.POST, path,
        data: params,
        options: Options(headers: generatorHeaderWithToken(token)));


    if (response.ok && response.statusCode == 200) {
      Map<String, dynamic> mapUser = {}
        ..addAll(response.data["userInfor"])
        ..addAll(response.data["user"]);
      final user = User.fromJson(mapUser);
      int fans = response.data["fans"];
      int attention = response.data["attention"];
      int todaySignin = response.data["todaySignin"];
      String couponCount = response.data["couponCount"];
      int forecastCardCount = response.data["forecastCardCount"];
      if (response.data["anchorInforResponseBody"] != null) {
        AnchorInfor anchorInfor =
            AnchorInfor.fromJson(response.data["anchorInforResponseBody"]);
        user.anchorInforResponseBody = anchorInfor;
      }

      user.fans = fans;
      user.attention = attention;
      user.todaySignin = todaySignin;
      user.token = token;
      user.couponCount = couponCount;
      user.forecastCardCount = forecastCardCount;
      success(user);
    } else {
      fail(response.error?.code ?? -1, response.error?.message ?? "服务器异常");
    }
    return response;
  }

  Future<HttpResponse> getUploadToken({
    required Success<String> success,
    required Fail fail,
  }) async {
    var params = {};
    String path = "/common/getUploadToken";
    HttpResponse response;
    response = await $engine.execute(Method.GET, path, data: params);
    if (response.ok) {
      final token = '${response.data}';
      success(token);
    } else {
      fail(response.error?.code ?? -1, response.error?.message ?? "服务器异常");
    }
    return response;
  }


  /// 账号注销
  Future<HttpResponse> destroryAccount({
    required String captcha,
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/api/user/deleteUserAccount";
    HttpResponse response =
        await $engine.execute(Method.POST, path, params: {"captcha": captcha});

    if (response.ok) {
      success("success");
    } else {
      fail(response.error?.code ?? -1, response.error?.message ?? "服务器异常");
    }
    return response;
  }

  /// 获取举报类型
  Future<HttpResponse> reportType({
    required ReportEnum type,
    required Success<List<ReportTypeModel>> success,
    required Fail fail,
  }) async {
    String path = "/api/report/getReportType";
    HttpResponse response =
        await $engine.execute(Method.GET, path, params: {"type": type.index});
    if (response.ok) {
      List<ReportTypeModel>? list = JsonUtil.getObjectList(
          response.data, (v) => ReportTypeModel.fromJson(v));
      success(list ?? []);
    } else {
      fail(response.error?.code ?? -1, response.error?.message ?? "服务器异常");
    }
    return response;
  }

  Future<HttpResponse> notify({
    required NotifyEnum notifyEnum,
    required int pageNum,
    required Success<PageModel<MixNotifyModel>> success,
    required Fail fail,
  }) async {
    String path = "/api/message/getMsgList";
    final params = {
      'type': notifyEnum.typeValue,
      'page': pageNum,
    };
    HttpResponse response =
        await $engine.execute(Method.GET, path, params: params);
    if (response.ok) {
      final page = PageModel<MixNotifyModel>.fromJson(
          response.data, (json) => MixNotifyModel.fromJson(json));
      success(page);
    } else {
      fail(response.error?.code ?? -1, response.error?.message ?? "服务器异常");
    }
    return response;
  }

  Future<HttpResponse> loginOneKey({
    required String accessCode,
    String invitationCode = "",
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/loginOneKey";
    final params = {
      'accessCode': accessCode,
      'invitationCode': invitationCode,
    };
    HttpResponse response =
        await $engine.execute(Method.POST, path, data: params);
    if (response.ok) {
      if(response.statusCode == 200) {
        String token = response.data["access_token"];
        success(token);
      } else {
        fail(response.statusCode ?? -1, response.msg ?? "服务器异常");
      }
    } else {
      fail(response.error?.code ?? -1, response.error?.message ?? "服务器异常");
    }
    return response;
  }


}
