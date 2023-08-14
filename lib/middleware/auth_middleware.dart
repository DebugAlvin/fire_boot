import 'package:fire_boot/routes/routes.dart';
import 'package:fire_boot/services/account_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  // TODO: implement priority
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    // TODO: implement redirect
    debugPrint('=======AuthMiddleware.redirect:$route');
    return super.redirect(route);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    debugPrint('=======AuthMiddleware.onPageCalled:$page');
    final account = AccountService.sharedInstance.currentUser;
    if (account == null) {
      debugPrint('${Get.rawRoute} must be login');
      AccountService.sharedInstance.pushToLoginPage();
      return null;
    }
    return super.onPageCalled(page);
  }
}
