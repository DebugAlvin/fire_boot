import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:fire_boot/widget/custom_empty_widget.dart';
import 'package:fire_boot/widget/custom_loading_widget.dart';
import 'package:fire_boot/widget/custom_netework_error_view.dart';
import 'package:flutter/material.dart';
import 'logic.dart';

class TestCustomStatePage extends BaseView<TestCustomStateLogic> {
  TestCustomStatePage({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return CustomAppBar(appBarTitleText: '测试自定义状态页面',);
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return SingleChildScrollView(
      child: Column(children: [
        const CustomLoadingWidget(width: 200,height: 200,color: Colors.black,),
        CustomNetWorkErrorView(color: Colors.blue.withOpacity(0.2),),
        const SizedBox(height: 20,),
        const CustomEmptyWidget(),
      ],),
    );
  }


}
