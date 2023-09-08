import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:fire_boot/widget/button/custom_small_mian_button.dart';
import 'package:flutter/material.dart';

class CustomNoLoginWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Color? color;
  final VoidCallback? onPressed;

  const CustomNoLoginWidget(
      {super.key,
      this.width,
      this.height,
      this.alignment,
      this.color,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: color,
      child: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: AppValues.defaultPadding * 2),
                  child: Image.asset(
                    'assets/images/ic_no_login_center.png',
                    width: 170,
                    height: 151,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      '你还没有登陆',
                      style: ThemeService().theme.textTheme.titleSmall,
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppValues.smallPadding,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      '登录账号，查看你关注的精彩内容',
                      style: ThemeService().theme.textTheme.labelMedium,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
            Positioned(
                bottom: 66,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: CustomSmallMainButton(
                    width: 300,
                    title: '登陆',
                    onTap: () {
                      if (onPressed != null) {
                        onPressed!();
                      }
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
