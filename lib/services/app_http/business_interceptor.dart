import 'dart:convert' as Convert;
import 'package:dio/dio.dart';
import 'dart:math';
import '../../utils/secret_util.dart';
import '../account_service.dart';
import 'http_status_code.dart';


class BusinessInterceptor extends Interceptor {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    //super.onRequest(options, handler);
    // options.headers
    if(AccountService.sharedInstance.isLogin()) {
      options.headers.addAll(generatorHeaderWithToken(AccountService.sharedInstance.currentUser!.token!));
    }
    // systemDeviceId
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    Map<String, dynamic> map = Convert.jsonDecode(response.toString());
    if(map.isNotEmpty) {
      //未登录需要拦截一下
      if(map["code"] == HttpResponseStatus.NOT_LOGIN){
        //这里可以发消息，发完消息之后走success回调
        // AccountService.sharedInstance.logoutUser();
        // eventBus.fire(UserTokenInvalidEvent());
        AccountService.sharedInstance.onUserTokenInvalid();
        response.data = {'code': 200, 'msg': '令牌无效','data': null};
        handler.next(response);
      }else{
        handler.next(response);
      }
    }

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

}
