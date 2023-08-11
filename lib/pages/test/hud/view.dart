import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:fire_boot/widget/button/custom_small_mian_button.dart';
import 'package:flutter/material.dart';
import 'logic.dart';

class TestHUDPage extends BaseView<TestHUDLogic> {
  TestHUDPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return const CustomAppBar(
      appBarTitleText: '测试HUD',
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CustomSmallMainButton(
            title: '测试Loading',
            onTap: () => controller.onTestLoading(context),
          ),
        ),
        const SizedBox(height: AppValues.defaultPadding,),
        Center(
          child: CustomSmallMainButton(
            title: '测试Toast',
            onTap: () => controller.onToast(context),
          ),
        ),
      ],
    );
  }
}
