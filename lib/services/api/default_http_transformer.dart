import 'package:dio/src/response.dart';
import 'package:fire_boot/utils/http/http_response.dart';
import 'package:fire_boot/utils/http/http_transformer.dart';
import 'http_status_code.dart';

class DefaultHttpTransformer extends HttpTransformer {
  @override
  HttpResponse parse(Response response) {
    // TODO: implement parse
    if (response.statusCode == HttpResponseStatus.SUCESS) {
      return HttpResponse.success(response.data["data"], response.data['code'], response.data['msg']);
    } else {
      return HttpResponse.failure(errorMsg: response.data["msg"], errorCode: response.data["code"]);
    }
  }
}
