import 'dart:ui';
import 'package:fire_boot/base/getx/base_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
class WebEntity{

  /// 标题
  String title = '';
  /// 链接
  String link = '';

  WebEntity({this.title = '', this.link = ''});

}

class WebBrowserLogic extends BaseController {


  late WebViewController webViewController;

  ///加载URL
  WebEntity detail = Get.arguments;

  ///进度条
  var progress = 0.0.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    webViewController = WebViewController.fromPlatformCreationParams(params);
    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int pro){
          progress.value = (pro / 100.0).toDouble();
        }
      ));
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    final uri = Uri.parse(detail.link);
    webViewController.loadRequest(uri);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

}
