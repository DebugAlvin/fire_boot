import 'package:flutter/material.dart';

// 路由操作枚举
enum RouteChangeType {
  push,
  pop
}

class CustomRouteListenWidget extends StatefulWidget {

  static RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  final Widget child;

  // 当前页面展示时的回调
  final Function(RouteChangeType)? appearHandler;

  // 当前页面消失时的回调
  final Function(RouteChangeType)? disappearHandler;

  const CustomRouteListenWidget({super.key, this.appearHandler, this.disappearHandler, required this.child});

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
    if (widget.appearHandler != null) {
      widget.appearHandler!(RouteChangeType.push);
    }
    super.didPush();
  }

  @override
  void didPop() {
    if (widget.disappearHandler != null) {
      widget.disappearHandler!(RouteChangeType.pop);
    }
    super.didPop();
  }

  @override
  void didPushNext() {
    if (widget.disappearHandler != null) {
      widget.disappearHandler!(RouteChangeType.push);
    }
    super.didPushNext();
  }

  @override
  void didPopNext() {
    if (widget.appearHandler != null) {
      widget.appearHandler!(RouteChangeType.pop);
    }
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

}