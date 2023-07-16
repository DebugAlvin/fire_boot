import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/pages/find/view.dart';
import 'package:fire_boot/pages/home/view.dart';
import 'package:fire_boot/pages/main/widget/main_page_bottom_bar_widget.dart';
import 'package:fire_boot/pages/match/index/view.dart';
import 'package:fire_boot/pages/message/view.dart';
import 'package:fire_boot/pages/mine/logic.dart';
import 'package:fire_boot/pages/mine/view.dart';
import 'package:fire_boot/pages/topic/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';
import 'code.dart';

class MainPage extends BaseView<MainLogic> {
  MainPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return null;
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return Container(
      key: UniqueKey(),
      child: Obx(() => getPageOnSelectedMenu(controller.selectedMenuCode)),
    );
  }

  ///bottom navigation bar
  @override
  Widget? bottomNavigationBar() {
    return MainPageBottomBarWidget(
      onMenuTap: (int code) {
        controller.onMenuSelected(MenuCode.values[code]);
      },
      selectedItemColor: AppThemes.textPrimaryColorDark,
      unselectedItemColor: AppThemes.lightGray,
      selectedIconColor: AppThemes.tabBarIconColorSelected,
      unselectedIconColor: AppThemes.tabBarIconColorUnselected,
      initSelectdIndex: 0,
      color: AppThemes.appBarIconColorWhite,
      controller: controller.bottomBarController,
    );
  }

  //
  final homeView = HomePage();
  final findView = FindPage();
  final topicView = TopicPage();
  final msgView = MessagePage();
  final mineView = MinePage();


  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME:
        return homeView;
      case MenuCode.FIND:
        return findView;
      case MenuCode.TOPIC:
        return topicView;
      case MenuCode.MSG:
        return msgView;
      case MenuCode.MINE: {
        // Get.delete<MineLogic>();
        return mineView;
      }
      default:
        return homeView;
    }
  }
}
