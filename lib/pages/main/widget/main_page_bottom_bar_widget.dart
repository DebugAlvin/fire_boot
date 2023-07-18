import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'main_page_bottom_bar_controller.dart';

///首页底部导航
class MainPageBottomBarWidget extends StatefulWidget {
  static final double contentHeight =
      (ScreenUtil().bottomBarHeight > 0) ? 83 : 49;

  const MainPageBottomBarWidget(
      {super.key,
      required this.selectedItemColor,
      required this.unselectedItemColor,
      required this.selectedIconColor,
      required this.unselectedIconColor,
      required this.initSelectdIndex,
      this.onMenuTap,
      this.onCenterTap,
      required this.color,
      required this.controller});

  // final Function(MenuCode menuCode) onNewMenuSelected;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final int initSelectdIndex;
  final ValueChanged<int>? onMenuTap;
  final Function? onCenterTap;
  final Color color;
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
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return _buildBottomBar();
  }

  _buildBottomBar() {
    return Container(
      alignment: Alignment.topCenter,
      key: bottomBarKey,
      color: widget.color,
      height: MainPageBottomBarWidget.contentHeight,
      child: Container(
        alignment: Alignment.topCenter,
        height: 49,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: _buildAnimatedText(
                    '首页', "ic_home.svg", "ic_homepage_selected.svg", 0)),
            Expanded(
                flex: 1,
                child: _buildAnimatedText('发现', "ic_forecastpage.svg",
                    "ic_forecastpage_selected.svg", 1)),
            Expanded(
                flex: 1,
                child: _buildAnimatedText(
                    '比赛', "ic_matchpage.svg", "ic_matchpage_selected.svg", 2)),
            Expanded(
                flex: 1,
                child: _buildAnimatedText(
                    '数据', "ic_datapage.svg", "ic_datapage_selected.svg", 3)),
            Expanded(
                flex: 1,
                child: _buildAnimatedText('我的', "ic_profilepage.svg",
                    "ic_profilepage_selected.svg", 4)),
          ],
        ),
      ),
    );
  }

  _buildAnimatedText(
      String barName, String iconName, String iconSelectedName, int index) {
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
          const SizedBox(height: 6),
          SvgPicture.asset(
              "assets/svg/${(index == selectdIndex) ? iconSelectedName : iconName}",
              width: 24,
              height: 24,
              color: (index == selectdIndex)
                  ? widget.selectedIconColor
                  : widget.unselectedIconColor),
          const SizedBox(height: 2),
          Text(
            barName,
            style: TextStyle(
                color: (index == selectdIndex)
                    ? widget.selectedItemColor
                    : widget.unselectedItemColor,
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
