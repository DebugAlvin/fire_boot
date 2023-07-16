import 'package:fire_boot/pages/web_browser/logic.dart';
import 'package:fire_boot/routes/routes.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class WebBrowserService {
  static WebBrowserService? _instance;

  static WebBrowserService _getInstance() {
    _instance ??= WebBrowserService();
    return _instance!;
  }

  static WebBrowserService get instance => _getInstance();

  Future<void> pushToWebPage(String title, String link,
      {Function(bool)? onResult}) async {
    Get.toNamed(Routes.webViewPage,
        preventDuplicates: false, // “防止重复”设置为 false
        arguments: WebEntity(
          title: title,
          link: link,
        ))?.then((value) async {
      if (value is bool && onResult != null) {
        onResult(value);
      }
    });
  }

  Future<bool> openWebBrowser(String url, {LaunchMode? mode}) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: mode ?? LaunchMode.externalApplication)) {
      return false;
    }
    return true;
  }
}
