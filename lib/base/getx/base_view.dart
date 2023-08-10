import 'package:fire_boot/services/account_service.dart';
import 'package:fire_boot/widget/custom_empty_widget.dart';
import 'package:fire_boot/widget/custom_loading_view.dart';
import 'package:fire_boot/widget/custom_netework_error_view.dart';
import 'package:fire_boot/widget/custom_no_login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:fire_boot/base/getx/page_state.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:fire_boot/utils/route_util.dart';
import '../../utils/keyboard_util.dart';
import 'base_controller.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller>{
  BaseView({super.key});

  /// get global key
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  ///appBar widget declaration
  PreferredSizeWidget? appBar(BuildContext context);

  /// body widget declaration
  Widget buildBody(BuildContext context);

  BuildContext? buildContext;


  ///base build widget
  @override
  Widget build(BuildContext context) {
    buildContext = context;
    return GestureDetector(
      onTap: () {
        KeyboardUtils.hideKeyboard(context);
      },
      child: Stack(
        children: [
          _annotatedRegion(context),
          Obx(() => controller.errorMessage.isNotEmpty
              ? _showSnackBar(controller.errorMessage)
              : Container()),
          Obx(() => controller.successMessage.isNotEmpty
              ? _showSnackBar(controller.successMessage)
              : Container()),
          Obx(() => controller.message.isNotEmpty
              ? _showSnackBar(controller.message)
              : Container()),
          // Container(),
        ],
      ),
    );
  }

  /// annoted region for Scaffold and statusbar design
  Widget _annotatedRegion(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: _pageScaffold(context),
    );
  }

  /// Page Scaffold elements organization and design
  Widget _pageScaffold(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset(),
      ///Status bar color for ios
      backgroundColor: scaffoldBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: Obx(() => controller.pageState == PageState.DEFAULT
          ? _pageContent(context)
          : _buildDataTemplate()),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
      floatingActionButtonLocation: floatingActionButtonLocation(),
    );
  }

  /// Default pageContent
  Widget _pageContent(BuildContext context) {
    return buildBody(context);
  }

  /// show error snackbar
  Widget _showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance?.addPersistentFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });

    return Container();
  }

  /// background color
  Color pageBackgroundColor() {
    return _themeData.backgroundColor;
  }

  Color scaffoldBackgroundColor() {
    return _themeData.scaffoldBackgroundColor;
  }

  bool resizeToAvoidBottomInset() {
    return true;
  }

  ThemeData get _themeData {
    return _isDark ? ThemeService.darkTheme : ThemeService.lightTheme;
  }

  ///Default FloatingActionButton
  Widget? floatingActionButton() {
    return null;
  }

  FloatingActionButtonLocation? floatingActionButtonLocation() {
    return null;
  }

  ///Default BottomNavigationBar
  Widget? bottomNavigationBar() {
    return null;
  }

  ///Default Drawer
  Widget? drawer() {
    return null;
  }

  ///override default theme
  ThemeMode? applyThemeMode(BuildContext? context) {
    return null;
  }


  bool get _isDark {
    final themeMode = applyThemeMode(buildContext);
    return themeMode != null
        ? (themeMode == ThemeMode.dark)
        : ThemeService().isDarkMode;
  }

  _buildDataTemplate() {
    Widget container = Container();
    if (controller.pageState == PageState.LOADING) {
      container = CustomLoadingView(
        color: pageBackgroundColor(),
        isDark: _isDark,
      );
    } else if (controller.pageState == PageState.FAILED) {
      container = CustomNetWorkErrorView(
        color: pageBackgroundColor(),
        onPressed: () => controller.onErrorPageNext(),
        isDark: _isDark,
      );
    } else if (controller.pageState == PageState.NEED_LOGIN) {
      container = CustomNoLoginView(
        color: scaffoldBackgroundColor(),
        onPressed: () => AccountService.sharedInstance.pushToLoginPage(),
      );
    } else {
      container = CustomEmptyWidget(
        color: pageBackgroundColor(),
      );
    }
    return container;
  }


}
