import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';

class LoginPage extends BaseView<LoginLogic> {
  LoginPage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return const CustomAppBar(appBarTitleText: '登录页面',);
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return Container();
  }
  
}
