import 'package:flutter/material.dart';

class CustomAppLifeCycleListenWidget extends StatefulWidget {
  final Widget child;

  const CustomAppLifeCycleListenWidget(
      {super.key,
      required this.child,
      this.didChangeAppLifecycleState,
      this.didChangeAccessibilityFeatures,
      this.didHaveMemoryPressure,
      this.didChangeDependencies,
      this.didChangeMetrics,
      this.didChangePlatformBrightness,
      this.didChangeTextScaleFactor});

  //  生命周期变化时回调
//  resumed:应用可见并可响应用户操作,app进入前台
//  inactive:用户可见，但不可响应用户操作，比如来了个电话,前后台切换的过渡状态
//  paused:已经暂停了，用户不可见、不可操作，app进入后台
//  suspending：应用被挂起，此状态IOS永远不会回调
  final Function(AppLifecycleState)? didChangeAppLifecycleState;

  //当前系统改变了一些访问性活动的回调
  final Function? didChangeAccessibilityFeatures;

  //低内存回调
  final Function? didHaveMemoryPressure;

  //当组件的依赖关系发生改变时回调
  final Function? didChangeDependencies;

  //应用尺寸改变时回调，例如旋转
  final Function? didChangeMetrics;

  //系统切换主题时回调
  final Function? didChangePlatformBrightness;

  //文字系数变化
  final Function? didChangeTextScaleFactor;

  @override
  _CustomAppLifeCycleListenWidgetState createState() =>
      _CustomAppLifeCycleListenWidgetState();
}

class _CustomAppLifeCycleListenWidgetState
    extends State<CustomAppLifeCycleListenWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); //添加观察者
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this); //销毁观察者
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return widget.child;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (widget.didChangeAppLifecycleState != null) {
      widget.didChangeAppLifecycleState!(state);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void didChangeAccessibilityFeatures() {
    if (widget.didChangeAccessibilityFeatures != null) {
      widget.didChangeAccessibilityFeatures!();
    }
    super.didChangeAccessibilityFeatures();
  }

  //低内存回调
  @override
  void didHaveMemoryPressure() {
    if (widget.didHaveMemoryPressure != null) {
      widget.didHaveMemoryPressure!();
    }
    super.didHaveMemoryPressure();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (widget.didChangeDependencies != null) {
      widget.didChangeDependencies!();
    }
    super.didChangeDependencies();
  }

  //应用尺寸改变时回调，例如旋转
  @override
  void didChangeMetrics() {
    if (widget.didChangeMetrics != null) {
      widget.didChangeMetrics!();
    }
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    if (widget.didChangePlatformBrightness != null) {
      widget.didChangePlatformBrightness!();
    }
    super.didChangePlatformBrightness();
  }

  @override
  void didChangeTextScaleFactor() {
    if (widget.didChangeTextScaleFactor != null) {
      widget.didChangeTextScaleFactor!();
    }
    super.didChangeTextScaleFactor();
  }
}
