import 'package:fire_boot/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:get/get.dart';

import 'logic.dart';

class TestTextPage extends BaseView<TestTextLogic> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return CustomAppBar(
      appBarTitleText: '测试文字',
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: 700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            Text(
              '特殊标题: 字号24',
              style: ThemeService().theme.textTheme.headlineSmall,
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            Text(
              '一级标题: 字号20',
              style: ThemeService().theme.textTheme.titleLarge,
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            Text(
              '二级标题: 字号18',
              style: ThemeService().theme.textTheme.titleMedium,
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            Text(
              '三级标题: 字号16',
              style: ThemeService().theme.textTheme.titleSmall,
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            Text(
              '正文: 字号14',
              style: ThemeService().theme.textTheme.bodyMedium,
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            Text(
              '提示： 字号12',
              style: ThemeService().theme.textTheme.bodySmall,
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            const Text('默认Text的配置 = 正文: 字号14 = bodyMedium'),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            Text(
              'copyWith修改字体粗细（例如button）',
              style: ThemeService()
                  .theme
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            Text(
              'copyWith修改文字颜色',
              style: ThemeService()
                  .theme
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.red),
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            CustomText(
              'CustomText 设置颜色',
              textColorStyle: CustomTextColorStyle.normal,
              style: ThemeService().theme.textTheme.headlineSmall,
            ),
            RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'RichText不一样的',
                    style: ThemeService()
                        .theme
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: CustomTextColorStyle.primary.value),
                  ),
                  TextSpan(
                    text: '字体颜色',
                    style: ThemeService()
                        .theme
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: CustomTextColorStyle.grey.value),
                  ),
                ])),
          ],
        ),
      ),
    );
  }
}
