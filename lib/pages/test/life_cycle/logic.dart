import 'package:fire_boot/base/getx/base_controller.dart';
import 'package:fire_boot/widget/custom_route_listen_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TestLifeCycleLogic extends BaseController {

  final appStateText = ''.obs;

  final routeStateText = ''.obs;

  final widgetStateText = ''.obs;

  Future<void> onDidChangeAppLifecycleState(AppLifecycleState state) async {
    if(state == AppLifecycleState.detached) {
      appStateText.value = 'AppLifecycleState.detached';
    }else if(state == AppLifecycleState.inactive) {
      appStateText.value = 'AppLifecycleState.inactive';
    }else if(state == AppLifecycleState.paused) {
      appStateText.value = 'AppLifecycleState.paused';
    }else if(state == AppLifecycleState.resumed) {
      appStateText.value = 'AppLifecycleState.resumed';
    }
    if (kDebugMode) {
      print(appStateText.value);
    }
  }

  Future<void> onDidChangeAccessibilityFeatures() async {
    widgetStateText.value = 'didChangeAccessibilityFeatures';
    if (kDebugMode) {
      print(widgetStateText.value);
    }
  }

  Future<void> onDidChangeDependencies() async {
    widgetStateText.value = 'didChangeDependencies';
    if (kDebugMode) {
      print(widgetStateText.value);
    }
  }

  Future<void> onDidChangeMetrics() async {
    widgetStateText.value = 'didChangeMetrics';
    if (kDebugMode) {
      print(widgetStateText.value);
    }
  }

  Future<void> onDidChangePlatformBrightness() async {
    widgetStateText.value = 'didChangePlatformBrightness';
    if (kDebugMode) {
      print(widgetStateText.value);
    }
  }

  Future<void> onDidChangeTextScaleFactor() async {
    widgetStateText.value = 'didChangeTextScaleFactor';
    if (kDebugMode) {
      print(widgetStateText.value);
    }
  }

  Future<void> onDidHaveMemoryPressure() async {
    widgetStateText.value = 'didHaveMemoryPressure';
    if (kDebugMode) {
      print(widgetStateText.value);
    }
  }

  Future<void> onRouteState(RouteState state) async {
    if(state == RouteState.didPush) {
      routeStateText.value = 'didPush';
    }else if(state == RouteState.didPushNext){
      routeStateText.value = 'didPushNext';
    }else if(state == RouteState.didPop) {
      routeStateText.value = 'didPop';
    }else if(state == RouteState.didPopNext) {
      routeStateText.value = 'didPopNext';
    }
    if (kDebugMode) {
      print(routeStateText.value);
    }
  }

}
