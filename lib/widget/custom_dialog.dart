// 弹出底部sheet
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:fire_boot/utils/route_util.dart';

import 'button/custom_button.dart';


Future<bool?> showCustomDialog({
  String title = '提示', // 标题
  String content = '',
  String confirmTitle = '确认',
  String cancelTitle = '取消',
  bool? showCancel = true,
}) async {
  bool? result;
  await Get.defaultDialog(
      title: title,
      titlePadding: const EdgeInsets.only(top: 37),
      contentPadding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      backgroundColor: AppThemes.pageLightBackground,
      titleStyle: ThemeService.lightTheme.textTheme.titleSmall,
      confirm: Padding(
        padding: const EdgeInsets.only(top: AppValues.smallPadding,bottom: AppValues.defaultPadding),
        child: Column(
          children: [
            _buildButton(
                title: confirmTitle,
                color: AppThemes.primaryColor,
                textColor: AppThemes.textPrimaryColorWhite,
                onPressed: () {
                  result = true;
                  RouteUtil.popView();
                }),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            showCancel == true ? _buildButton(
                title: cancelTitle,
                textColor: AppThemes.textColorGrey,
                onPressed: () {
                  result = false;
                  RouteUtil.popView();
                }, color: Colors.transparent) : Container(),
          ],
        ),
      ),
      content: Text(content,style: ThemeService.lightTheme.textTheme.bodySmall,));
  return result;
}

_buildButton(
    {required String title,
      required Color color,
      required Color textColor,
      required VoidCallback onPressed}) {
  return CustomButton(
    // height: 44,
    onTap: (){
      onPressed();
    },
    child: Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(44.0)),
        color: color,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: ThemeService().theme.textTheme.bodySmall?.copyWith(
          color: textColor,
        ),
      ),
    ),
  );
}