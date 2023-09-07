class CommonUtil {
  ///比较版本号大小  app版本号跟服务器版本号比高低
  ///version1 新版本号
  ///version2 当前版本号
  ///true 有最新版本
  ///false 没有最新版本
  bool compareVersion(String version1, String version2, [int length = 3]) {
    final v1 = version1.split('.')
      ..remove('')
      ..addAll(List.filled(length, '0'))
      ..sublist(0, length);
    final v2 = version2.split('.')
      ..remove('')
      ..addAll(List.filled(length, '0'))
      ..sublist(0, length);

    for (final i in List.generate(length, (i) => i)) {
      final v11 = int.parse(v1[i]);
      final v22 = int.parse(v2[i]);
      if (v11 > v22) {
        return true;
      } else if (v11 < v22) {
        return false;
      }
    }
    return false;
  }
}
