import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:fire_boot/widget/refresh/custom_pull_to_refresh.dart';
import 'package:fire_boot/widget/refresh/custom_pull_to_refresh_controller.dart';
import 'package:get/get.dart';
import 'logic.dart';

class TestRefreshPage extends BaseView<TestRefreshLogic> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return const CustomAppBar(
      appBarTitleText: '测试下拉上拉刷新',
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return CustomPullToRefresh(
      onRefresh: () async {
        ///模拟网络加载
        await Future.delayed(const Duration(seconds: 3));
        controller.pullToRefreshController.finishRefresh();
        controller.listSize.value = 30;
      },
      onLoadMore: () async {
        ///模拟网络加载
        await Future.delayed(const Duration(seconds: 3));
        if (controller.listSize.value > 60) {
          controller.pullToRefreshController
              .finishLoad(result: CustomIndicatorResult.noMore);
        } else {
          controller.listSize.value = controller.listSize.value + 30;
          controller.pullToRefreshController.finishLoad();
        }
      },
      controller: controller.pullToRefreshController,
      child: Obx(() {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.listSize.value,
            itemBuilder: (context, index) {
              return ListCard(
                index: index,
              );
            });
      }),
    );
  }
}

class ListCard extends StatelessWidget {
  final int index;

  const ListCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: getRandomColor(),
      height: 44,
      child: Center(
        child: Text('$index'),
      ),
    );
  }

  Color getRandomColor({int r = 255, int g = 255, int b = 255, a = 255}) {
    if (r == 0 || g == 0 || b == 0) return Colors.black;
    if (a == 0) return Colors.white;
    return Color.fromARGB(
      a,
      r != 255 ? r : Random.secure().nextInt(r),
      g != 255 ? g : Random.secure().nextInt(g),
      b != 255 ? b : Random.secure().nextInt(b),
    );
  }
}
