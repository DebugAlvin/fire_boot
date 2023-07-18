import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/widget/custom_route_listen_widget.dart';
import 'package:flutter/material.dart';
import 'logic.dart';

class MinePage extends BaseView<MineLogic> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return null;
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return CustomRouteListenWidget(
        appearHandler: (changeType){
          print('页面加载');
        },
        disappearHandler: (changeType){
          print('页面消失');
        },
        child: Container());
  }

}
