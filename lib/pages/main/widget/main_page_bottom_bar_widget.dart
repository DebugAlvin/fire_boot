import 'dart:ui';
import 'package:fire_boot/utils/widget_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'main_page_bottom_bar_controller.dart';

///首页底部导航
class MainPageBottomBarWidget extends StatefulWidget {

  const MainPageBottomBarWidget({
    super.key,
    required this.initSelectdIndex,
    this.onMenuTap,
    this.onCenterTap,
    required this.controller,
    this.themeData,
  });

  final int initSelectdIndex;
  final ValueChanged<int>? onMenuTap;
  final Function? onCenterTap;
  final BottomNavigationBarThemeData? themeData;
  final MainPageBottomBarController controller;

  @override
  State<StatefulWidget> createState() {
    return _MainPageBottomBarWidgetState();
  }
}

class _MainPageBottomBarWidgetState extends State<MainPageBottomBarWidget> {
  // final MainPageScrollController mainPageScrollController = Get.find();
  //用来获取BottomBar的高度
  final GlobalKey bottomBarKey = GlobalKey();
  late Widget _bottomBarLayout;

  // late final StreamSubscription subscription;
  int? selectdIndex;

  @override
  void initState() {
    super.initState();
    selectdIndex = widget.initSelectdIndex;
    widget.controller.selectedMenuTap = (int index) {
      setState(() {
        selectdIndex = index;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return _buildBottomBar(context);
  }

  _buildBottomBar(BuildContext context) {
    final defaultTheme =
        widget.themeData ?? ThemeService().theme.bottomNavigationBarTheme;
    final bottomPaddingHeight = WidgetUtil.getBottomPaddingHeight(context);
    //? 83 : 49
    final bottomBarHeight = bottomPaddingHeight > 0 ? 83.0 : 49.0;
    return Container(
      alignment: Alignment.topCenter,
      key: bottomBarKey,
      color: defaultTheme.backgroundColor,
      height: bottomBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppValues.defaultPadding),
      child: Container(
        alignment: Alignment.topCenter,
        height: 49,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: _buildAnimatedText(
                    barName: '首页',
                    iconName: "ic_home.svg",
                    iconSelectedName: "ic_homepage_selected.svg",
                    index: 0,
                    themeData: defaultTheme)),
            Expanded(
                flex: 1,
                child: _buildAnimatedText(
                    barName: '发现',
                    iconName: "ic_forecastpage.svg",
                    iconSelectedName: "ic_forecastpage_selected.svg",
                    index: 1,
                    themeData: defaultTheme)),
            Expanded(
                flex: 1,
                child: _buildAnimatedText(
                    barName: '比赛',
                    iconName: "ic_matchpage.svg",
                    iconSelectedName: "ic_matchpage_selected.svg",
                    index: 2,
                    themeData: defaultTheme)),
            Expanded(
                flex: 1,
                child: _buildAnimatedText(
                    barName: '数据',
                    iconName: "ic_datapage.svg",
                    iconSelectedName: "ic_datapage_selected.svg",
                    index: 3,
                    themeData: defaultTheme)),
            Expanded(
                flex: 1,
                child: _buildAnimatedText(
                    barName: '我的',
                    iconName: "ic_profilepage.svg",
                    iconSelectedName: "ic_profilepage_selected.svg",
                    index: 4,
                    themeData: defaultTheme)),
          ],
        ),
      ),
    );
  }

  _buildAnimatedText(
      {required String barName,
        required String iconName,
        required String iconSelectedName,
        required int index,
        required BottomNavigationBarThemeData themeData}) {
    return TextButton(
        onPressed: () {
          setState(() {
            selectdIndex = index;
          });
          if (widget.onMenuTap != null) {
            widget.onMenuTap!(index);
          }
        },
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Column(children: [
          (index != selectdIndex)
              ? const SizedBox(
            height: 4,
          )
              : Container(
            alignment: Alignment.centerRight,
            height: 4,
            width: 42,
            color: ThemeService().theme.colorScheme.secondary,
          ),
          const SizedBox(height: 4),
          SvgPicture.asset(
              "assets/svg/${(index == selectdIndex) ? iconSelectedName : iconName}",
              width: 18,
              height: 18,
              color: (index == selectdIndex)
                  ? themeData.selectedItemColor
                  : themeData.unselectedItemColor),
          const SizedBox(height: 2),
          Text(
            barName,
            style: TextStyle(
                color: ThemeService().theme.colorScheme.onBackground,
                fontSize: 10,
                fontWeight: FontWeight.normal),
          )
        ]));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // subscription.cancel();
  }
}
