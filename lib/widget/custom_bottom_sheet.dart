import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:fire_boot/utils/route_util.dart';

import 'button/custom_button.dart';

const double itemHeight = 50;

Future<int?> showCustomBottomSheet({
  List<String> children = const <String>[],
  required String title,
  bool safeArea = true,
  double radiusSize = 5.0, // 默认圆角为5
  double padding = 15.0, // 默认左右间距为10
}) async {
  int? selectdIndex;
  await Get.bottomSheet(
      GestureDetector(
          behavior:HitTestBehavior.opaque,
        onTap: (){
          RouteUtil.popView();
        },
        child: Container(
          padding: EdgeInsets.only(
              left: padding,
              right: padding,
              bottom: safeArea ? padding + 34 : padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(radiusSize))),
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(
                    minHeight: itemHeight,
                  ),
                  child: _buildColumn(children, onPressed: (index) {
                    selectdIndex = index;
                  }),
                ),
              ),
              Container(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  RouteUtil.popView();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.all(Radius.circular(radiusSize))),
                  alignment: Alignment.center,
                  height: itemHeight,
                  child: Text(
                    '取消',
                    style: ThemeService.lightTheme.textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent);
  return selectdIndex;
}

_buildColumn(List<String> children,
    {required Function(int selectdIndex) onPressed}) {
  final List<Widget> widgets = [];
  for (int index = 0; index < children.length; index++) {
    final isLastOne = (index + 1) == children.length ? true : false;
    widgets.add(CustomButton(
        onTap: () {
          onPressed(index);
          RouteUtil.popView();
        },
        child: _actionItem(title: children[index], isLastOne: isLastOne)));
  }
  return Column(children: widgets);
}

/// 添加时候的item
Widget _actionItem({
  required String title,
  Color backgroundColor = Colors.white,
  bool isLastOne = false, // 是否为最后一个，最后一个如果有圆角的话需要增加底部圆角
  double height = itemHeight,
}) {
  return Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        alignment: Alignment.center,
        height: height,
        child: Text(
          title,
          style: ThemeService.lightTheme.textTheme.bodyMedium,
        ),
      ),

      /// 分割线
      !isLastOne
          ? const Divider(
              height: 0.5,
              indent: 0,
              endIndent: 0,
            )
          : Container(),
    ],
  );
}
