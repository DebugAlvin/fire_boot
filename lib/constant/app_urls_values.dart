import 'package:fire_boot/services/branch/branch.dart';

abstract class AppUrlsValues {


  // 获取线路地址
  static String line_url = '${baseAssetsList[0]}/app/json/domain.json';

  /// 可用api列表
  static List<String> baseProdApiList = [
    'https://h5.1234.com',
    'https://h5.1235.com',
  ];

  /// 可用静态资源列表，和可用api相对应
  static List<String> baseAssetsList = ['https://dl.sanbox.cc'];

  // 开发环境
  static final Branch dev = Branch(
    asset_url: 'http://dl.asset_url.com',
    api_url: "http://h5.api_url.com",
    cp_url: "http://cp.cp_url.com",
    chat_url: "http://chat.chat_url.com/main/home?d=app",
    ws_url: "0.0.0.0",
    port: 1891,
    log_url: "http://ht.log_url.com",
  );

  // 测试环境
  static final Branch test = Branch(
    asset_url: 'http://dl.asset_url.com',
    api_url: "http://h5.api_url.com",
    cp_url: "http://cp.cp_url.com",
    chat_url: "http://chat.chat_url.com/main/home?d=app",
    ws_url: "0.0.0.0",
    port: 1891,
    log_url: "http://ht.log_url.com",
  );

  // 生产环境
  static final Branch prod = Branch(
    asset_url: baseAssetsList[0],
    api_url: baseProdApiList[0],
    cp_url: "http://cp.cp_url.com",
    chat_url: "http://chat.chat_url.com/main/home?d=app",
    ws_url: "0.0.0.0",
    port: 1891,
    log_url: "http://ht.log_url.com",
  );
}