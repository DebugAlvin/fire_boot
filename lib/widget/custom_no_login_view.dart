import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'button/custom_button.dart';

class CustomNoLoginView extends StatelessWidget {
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Color? color;
  final VoidCallback? onPressed;

  const CustomNoLoginView(
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
            Positioned.fill(
                child: Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 66),
                child: CustomButton(
                  // useAccentColor: true,
                  borderRadius: const BorderRadius.all(Radius.circular(44.0)),
                  // width: 300.w,
                  // height: 44,
                  title: '登陆',
                  onTap: (){
                    if(onPressed != null) {
                      onPressed!();
                    }
                  },
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
