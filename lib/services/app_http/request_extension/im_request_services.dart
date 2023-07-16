import 'package:fire_boot/model/temp_im_token.dart';
import 'package:fire_boot/services/device_service.dart';
import 'package:fire_boot/utils/http/http_engine.dart';
import 'package:fire_boot/utils/http/http_response.dart';
import '../app_request_service.dart';

extension ImRequestService on AppRequestService {
  Future<HttpResponse> getImToken({
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/common/getImToken";
    HttpResponse response = await $engine.execute(
      Method.GET,
      path,
    );
    if (response.ok) {
      if(response.statusCode == 200) {
        success(response.data);
      } else {
        fail(response.statusCode ?? -1, response.msg ?? "服务器异常");
      }
    } else {
      fail(response.error?.code ?? -1, response.error?.message ?? "服务器异常");
    }
    return response;
  }

  Future<HttpResponse> getTempImToken({
    required Success<TempImTokenModel> success,
    required Fail fail,
  }) async {
    final params = {'systemDeviceId':DeviceService.instance.getDeviceId()};
    String path = "/common/getTampImToken";
    HttpResponse response = await $engine.execute(
      Method.GET,
      path,
      params: params,
    );
    if (response.ok) {
      final model = TempImTokenModel.fromJson(response.data);
      success(model);
    } else {
      fail(response.error?.code ?? -1, response.error?.message ?? "服务器异常");
    }
    return response;
  }

}
