import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/widget/custom_app_bar.dart';
import 'package:fire_boot/widget/custom_app_life_cycle_listen_widget.dart';
import 'package:fire_boot/widget/custom_button.dart';
import 'package:fire_boot/widget/custom_route_listen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MatchDetailPage extends BaseView<MatchDetailLogic> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return CustomAppBar(
      appBarTitleText: '比赛详情',
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return CustomAppLifeCycleListenWidget(
      didChangeAppLifecycleState: (state){
        print('app状态：${state}');
      },
        child: Column(
          children: [
            CustomButton(
              title: '收藏文章',
              onPressed: (){
                controller.onArticleCollect();
              },
            )
          ],
        ));
  }
}
