import 'package:fire_boot/base/getx/base_view.dart';
import 'package:fire_boot/routes/routes.dart';
import 'package:fire_boot/services/theme/theme_color.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:fire_boot/utils/route_util.dart';
import 'package:fire_boot/widget/button/custom_button.dart';
import 'package:fire_boot/widget/button/custom_icon_button.dart';
import 'package:fire_boot/widget/app_bar/custom_app_bar.dart';
import 'package:fire_boot/widget/custom_toast.dart';
import 'package:fire_boot/widget/update/custom_update_controller.dart';
import 'package:fire_boot/widget/update/custom_update_dialog.dart';
import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import 'logic.dart';

class HomePage extends BaseView<HomeLogic> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return const CustomAppBar(
      appBarTitleText: '首页',
      showLeading: false,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    // TODO: implement buildBody
    return Column(
      children: [
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testButtonPage);
            },
            child: const Text('CustomButton样例')),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testStatePage);
            },
            child: const Text('页面状态样例')),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testCustomStatePage);
            },
            child: const Text('自定义页面状态样例')),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testLifeCyclePage);
            },
            child: const Text('生命周期样例')),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testHUDPage);
            },
            child: const Text('HUD样例')),
        CustomButton(
            onTap: () {
              showCustomUpdateDialog(
                  context: context,
                  title: 'APP更新',
                  remark: '备注',
                  canForceUpdate: true,
                  controller: CustomUpdateController(),
                  onConfirm: () {});
            },
            child: const Text('更新弹窗')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('开启暗黑模式'),
            Switch(
                value: ThemeService.instance.isDarkMode,
                onChanged: (value) {
                  if (value) {
                    ThemeService.instance.switchTheme(ThemeMode.dark);
                  } else {
                    ThemeService.instance.switchTheme(ThemeMode.light);
                  }
                }),
          ],
        ),
        Column(
          children: [
            const Text('选择主题色(点击切换)'),
            _buildColorRow(),
          ],
        ),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.needLoginPage);
            },
            child: const Text('测试拦截器')),
        Text('国际化文本：${S.of(context).hello_text}'),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testTextPage);
            },
            child: const Text('测试Text配置')),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testRefreshPage);
            },
            child: const Text('测试其它上拉下拉刷新')),
        CustomButton(
            onTap: () {
              RouteUtil.pushToView(Routes.testOtherPage);
            },
            child: const Text('测试其它Widget')),
      ],
    );
  }

  _buildColorRow() {
    List<Widget> widgets = [];
    for (ThemeColor themeColor in ThemeService.instance.themeColors) {
      widgets.add(GestureDetector(
        onTap: () {
          ThemeService.instance.switchThemeColor(themeColor);
        },
        child: ThemeColorCard(
            color: Color(themeColor.value.value), label: themeColor.label),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }
}

class ThemeColorCard extends StatelessWidget {
  final Color color;
  final String label;

  const ThemeColorCard({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(
          width: 70,
          height: 30,
          child: Container(
            color: color,
          ),
        ),
        Center(
          child: Text(label),
        )
      ],
    );
  }
}
