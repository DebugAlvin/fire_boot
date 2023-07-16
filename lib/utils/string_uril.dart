

class StringUtil {

  /// 计算字符串中中文的个数
  static int chineseLength(String str) {
    RegExp exp = RegExp(r'[\u4e00-\u9fa5]');
    int length = 0;
    for (int i = 0; i < str.length; i++) {
      if (exp.hasMatch(str[i])) {
        length++;
      }
    }
    return length;
  }

  /// 判断字符串是否包含中文
  static bool containsChinese(String str) {
    RegExp exp = RegExp(r'[\u4e00-\u9fa5]');
    return exp.hasMatch(str);
  }


}