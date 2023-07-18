import 'dart:io';

import 'package:filesize/filesize.dart';
import 'package:path_provider/path_provider.dart';

class CacheUtil {
  /// 获取缓存大小
  static Future<String> total() async {
    Directory tempDir = await getTemporaryDirectory();
    // ignore: unnecessary_null_comparison
    if (tempDir == null) return filesize(0);
    int total = await _reduce(tempDir);
    return filesize(total);
  }

  /// 清除缓存
  static Future<void> clear() async {
    Directory tempDir = await getTemporaryDirectory();
    if (tempDir == null) return;
    await _delete(tempDir);
  }

  /// 递归缓存目录，计算缓存大小
  static Future<int> _reduce(final FileSystemEntity file) async {
    /// 如果是一个文件，则直接返回文件大小
    if (file is File) {
      int length = await file.length();
      return length;
    }

    /// 如果是目录，则遍历目录并累计大小
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();

      int total = 0;

      if (children.isNotEmpty)
        for (final FileSystemEntity child in children) {
          total += await _reduce(child);
        }

      return total;
    }

    return 0;
  }

  /// 递归删除缓存目录和文件
  static Future<void> _delete(FileSystemEntity file) async {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await _delete(child);
      }
    } else {
      await file.delete();
    }
  }
}