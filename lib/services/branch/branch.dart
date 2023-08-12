// 环境配置
class Branch {
  final String asset_url;
  final String api_url;
  final String cp_url;
  final String chat_url;
  final String ws_url;
  final int port;
  final String log_url;

  Branch({
    required this.asset_url,
    required this.api_url,
    required this.cp_url,
    required this.chat_url,
    required this.ws_url,
    required this.port,
    required this.log_url,
  });
}