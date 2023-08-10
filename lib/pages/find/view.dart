import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class FindPage extends BaseView<FindLogic> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return null;
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    // return CustomAppBar(backgroundColor: Colors.black.withOpacity(0),);
    return Stack(
      children: [
        CustomAppBar(backgroundColor: Colors.white),
      ],
    );
  }
}
