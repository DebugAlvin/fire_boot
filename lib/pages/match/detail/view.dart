import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MatchDetailPage extends BaseView<MatchDetailLogic> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return CustomAppBar(appBarTitleText: '比赛详情',);
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return Container();
  }

}
