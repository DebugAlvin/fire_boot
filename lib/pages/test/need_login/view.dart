import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class NeedLoginPage extends BaseView<NeedLoginLogic> {
  NeedLoginPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return CustomAppBar(appBarTitleText: '测试拦截器',);
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return Container();
  }


}
