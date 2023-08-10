import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/routes/routes.dart';
import 'package:fire_boot/utils/route_util.dart';
import 'package:fire_boot/widget/button/custom_button.dart';
import 'package:fire_boot/widget/button/custom_icon_button.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:fire_boot/widget/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'logic.dart';

class HomePage extends BaseView<HomeLogic> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return CustomAppBar(
      appBarTitleText: '首页',
      showLeading: false,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return Column(
      children: [
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.matchDetailPage);
            },
            child: const Text('点击下一页（正常导航栏）')),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.matchDetailPage);
            },
            child: const Text('点击下一页（透明导航栏）')),
        CustomIconButton(
          onTap: (){
            CustomToast.show('成功', context);
          },
          name: '返回',
          direction: Direction.left,
          widgetHeight: 44,
          widgetWidth: 70,
          iconWidget: Center(
            child: SvgPicture.asset(
              'assets/svg/ic_close_outlined.svg',
              width: 18,
              height: 18,
            ),
          ),
        )
      ],
    );
  }
}
