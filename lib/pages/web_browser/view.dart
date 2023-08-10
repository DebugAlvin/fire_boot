import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'logic.dart';

class WebBrowserPage extends BaseView<WebBrowserLogic> {
  WebBrowserPage({Key? key}) : super(key: key);


  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return CustomAppBar(
      appBarTitleText: controller.detail.title,
    );
  }


  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement body
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _buildWebView(),
      ),
    );

  }

  Widget _buildWebView(){

    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        WebViewWidget(
          controller: controller.webViewController,
          // initialUrl: controller.detail.link,
          // javascriptMode: JavascriptMode.unrestricted,
          // onProgress: (pro) {
          //   controller.progress.value = (pro / 100).toDouble();
          // },
        ),
        Obx(() => Visibility(
          visible: controller.progress < 1,
          child: LinearProgressIndicator(
            minHeight: 2,
            backgroundColor: Colors.transparent,
            color: ThemeService().theme.primaryColor,
            value: controller.progress.value,
          ),
        )),
      ],
    );
  }
}
