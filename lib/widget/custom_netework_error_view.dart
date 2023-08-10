import 'package:fire_boot/widget/button/custom_small_mian_button.dart';
import 'package:fire_boot/widget/button/cutom_big_main_button.dart';
import 'package:flutter/material.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:lottie/lottie.dart';
import 'button/custom_button.dart';

class CustomNetWorkErrorView extends StatelessWidget {
  const CustomNetWorkErrorView(
      {Key? key, this.width, this.height, this.alignment = Alignment.center, this.color, this.onPressed, this.isDark})
      : super(key: key);
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Color? color;
  final VoidCallback? onPressed;
  final bool? isDark;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final isDarkMode = isDark ?? ThemeService().isDarkMode;
    final theme = isDarkMode ? ThemeService.darkTheme : ThemeService.lightTheme;
    return Center(
        child: Container(
          width: width,
          height: height,
          alignment: alignment,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lottie/refresh_error.json',
                repeat: true,
                reverse: true,
                animate: true,
                width: 200,
                height: 180,
              ),
              Text(
                "咦？网络开小差了",
                style: theme.textTheme.bodySmall,
              ),
              Text("点下方按钮唤醒一下它！", style: theme.textTheme.bodySmall),
              const SizedBox(
                height: AppValues.defaultPadding,
              ),
              CustomSmallMainButton(
                width: 100,
              // maxWidth: 150,
                // height: 40,
                // useAccentColor: true,
                // borderRadius: const BorderRadius.all(Radius.circular(5)),
                // border: Border.all(color: ThemeService().theme.primaryColor, width: 1),
                title: '重新加载',
                //controller.onErrorPageNext()
                onTap: () {
                  if(onPressed != null) {
                    onPressed!();
                  }
                },
              ),
            ],
          ),
        ));
  }

}