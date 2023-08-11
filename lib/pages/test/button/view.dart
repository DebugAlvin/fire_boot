import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:fire_boot/widget/button/custom_big_ghost_button.dart';
import 'package:fire_boot/widget/button/custom_button.dart';
import 'package:fire_boot/widget/button/custom_small_mian_button.dart';
import 'package:fire_boot/widget/button/custom_small_outline_button.dart';
import 'package:fire_boot/widget/button/cutom_big_main_button.dart';
import 'package:flutter/material.dart';
import 'logic.dart';

class TestButtonPage extends BaseView<TestButtonLogic> {
  TestButtonPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return const CustomAppBar(appBarTitleText: '按钮样例',);
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppValues.defaultPadding),
        child: Column(
          children: [
            CustomButton(
              alignment: Alignment.center,
              backgroundColor: Colors.red,
              constraints: const BoxConstraints(
                minHeight: 80,
                maxWidth: 190,
              ),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              title: '自定义按钮',
              onTap: () {
                print('点击自定义按钮');
              },
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            const CustomBigGhostButton(
              title: '幽灵按钮',
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            const CustomBigMainButton(
              title: '大主色按钮',
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            const CustomBigMainButton(
              title: '大主色按钮（禁用状态）',
              isEnable: false,
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSmallMainButton(
                  title: '小按钮',
                ),
                SizedBox(
                  width: AppValues.defaultPadding,
                ),
                CustomSmallMainButton(
                  title: '小按钮',
                  textColor: Colors.red,
                ),
                SizedBox(
                  width: AppValues.defaultPadding,
                ),
                CustomSmallMainButton(
                  title: '自适应小按钮',
                  textColor: Colors.blue,
                  fontSize: 22,
                ),
              ],
            ),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            const CustomSmallMainButton(
              title: '小按钮（禁用）',  isEnable: false,),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSmallOutlineButton(title: '小边框按钮'),
                SizedBox(
                  width: AppValues.defaultPadding,
                ),
                CustomSmallOutlineButton(title: '小边框按钮(禁用)', isEnable: false),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
