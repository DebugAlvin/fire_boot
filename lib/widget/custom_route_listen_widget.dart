import 'package:flutter/material.dart';

// 路由操作枚举
enum RouteState {
  didPush,
  didPushNext,
  didPop,
  didPopNext,
}

class CustomRouteListenWidget extends StatefulWidget {

  static RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  final Widget child;

  // 当前页面展示时的回调
  final Function(RouteState)? handler;

  const CustomRouteListenWidget({super.key, this.handler, required this.child});

  @override
  _CustomRouteListenWidgetState createState() => _CustomRouteListenWidgetState();

}

class _CustomRouteListenWidgetState extends State<CustomRouteListenWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    ModalRoute? route = ModalRoute.of(context);
    if (route != null) {
      CustomRouteListenWidget.routeObserver.unsubscribe(this);
      // 注册监听
      CustomRouteListenWidget.routeObserver.subscribe(this, route as PageRoute);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // 移除监听
    CustomRouteListenWidget.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    if (widget.handler != null) {
      widget.handler!(RouteState.didPush);
    }
    super.didPush();
  }

  @override
  void didPop() {
    if (widget.handler != null) {
      widget.handler!(RouteState.didPop);
    }
    super.didPop();
  }

  @override
  void didPushNext() {
    if (widget.handler != null) {
      widget.handler!(RouteState.didPushNext);
    }
    super.didPushNext();
  }

  @override
  void didPopNext() {
    if (widget.handler != null) {
      widget.handler!(RouteState.didPopNext);
    }
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

}