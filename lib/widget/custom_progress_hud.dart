import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'custom_safe_dialog.dart';

class CustomPageLoading extends StatelessWidget {
  final String? content;
  final BoxConstraints constraints;
  final ThemeData themeData;
  final double iconSize;
  final EdgeInsetsGeometry? textPadding;

  const CustomPageLoading({
    Key? key,
    this.content,
    this.constraints = const BoxConstraints(
      minWidth: 100,
      maxWidth: 180,
      minHeight: 80,
      maxHeight: 100,
    ),
    required this.themeData,
    this.textPadding,
    this.iconSize = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadingText = content ?? '';
    final defaultTextPadding =
        textPadding ?? const EdgeInsets.only(top: AppValues.defaultPadding);

    return Center(
      child: Container(
        constraints: constraints,
        decoration: BoxDecoration(
            color: themeData.colorScheme.inverseSurface,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: iconSize,
              width: iconSize,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor:
                    AlwaysStoppedAnimation(themeData.colorScheme.onInverseSurface),
              ),
            ),
            Visibility(
              visible: loadingText.isNotEmpty,
              child: Container(
                padding: defaultTextPadding,
                child: Text(
                  loadingText,
                  maxLines: 1,
                  style: themeData.textTheme.titleSmall?.copyWith(
                      overflow: TextOverflow.ellipsis,
                      color: themeData.colorScheme.onInverseSurface,
                      decoration: TextDecoration.none),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomLoadingDialog extends Dialog {
  const CustomLoadingDialog(
    this.themeData, {
    super.key,
    required this.content,
  });

  /// 加载时的提示文案
  final String? content;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return CustomPageLoading(
      content: content,
      themeData: themeData,
    );
  }
}

class CustomProgressHUD {
  /// tag 用于在 BrnSafeDialog 中标记类型
  static const String _loadingDialogTag = '_loadingDialogTag';

  /// 展示加载弹窗的静态方法。
  ///
  ///  * [context] 上下文
  ///  * [content] 加载时的提示文案
  ///  * [barrierDismissible] 点击蒙层背景是否关闭弹窗，默认为 false，不可关闭，详见 [showDialog] 中的 [barrierDismissible]
  ///  * [useRootNavigator] 把弹窗添加到 [context] 中的 rootNavigator 还是最近的 [Navigator]，默认为 true，添加到
  ///    rootNavigator，详见 [showDialog] 中的 [useRootNavigator]。
  static Future<T?> show<T>(
    BuildContext context, {
    String? content,
    bool barrierDismissible = false,
    bool useRootNavigator = true,
    ThemeData? themeData,
  }) {
    final defaultTheme = themeData ?? ThemeService().theme;
    return CustomSafeDialog.show<T>(
        context: context,
        tag: _loadingDialogTag,
        barrierDismissible: barrierDismissible,
        useRootNavigator: useRootNavigator,
        builder: (_) {
          return CustomLoadingDialog(defaultTheme, content: content);
        });
  }

  /// 关闭弹窗。
  ///
  ///  * [context] 上下文。
  static void dismiss<T extends Object?>(BuildContext context, [T? result]) {
    CustomSafeDialog.dismiss<T>(
        context: context, tag: _loadingDialogTag, result: result);
  }
}
