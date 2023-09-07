import 'package:fire_boot/services/event/event_service.dart';

const String kUpdateRefreshResultEvent = 'kUpdateRefreshResultEvent';

enum CustomIndicatorResult {
  /// No state until the task is not triggered.
  none,

  /// Task succeeded.
  success,

  /// Task failed.
  fail,

  /// No more data.
  noMore,
}

enum CustomIndicatorMode {
  /// Default state, 不活跃的
  inactive,

  /// 滚动中...
  drag,

  // /// Overscroll and reach the trigger task distance.
  // /// This state is released and the list triggers the task.
  // armed,
  //
  // /// Overscroll and about to trigger a task.
  // /// This state indicates that the user has released.
  // ready,

  /// Task in progress.
  /// In progress until the task is completed.
  processing,

  /// Task completed.
  /// The task is over, but the whole process is not complete.
  /// Set the ending animation, which will be done after this state.
  processed,

  /// The whole process is done.
  /// When finished, go back to [inactive]
  done,
}


class CustomPullToRefreshController {
  final bool controlFinishRefresh;
  final bool controlFinishLoad;

  /// Task completion result.
  CustomIndicatorResult footIndicatorResult = CustomIndicatorResult.none;

  CustomIndicatorMode indicatorMode = CustomIndicatorMode.inactive;

  CustomPullToRefreshController({
    this.controlFinishRefresh = false,
    this.controlFinishLoad = false,
  });

  void finishLoad({CustomIndicatorResult result = CustomIndicatorResult.success}) {
    footIndicatorResult = result;
    EventService.instance.dispatchEvent(kUpdateRefreshResultEvent);
  }

  void finishRefresh() {
    indicatorMode = CustomIndicatorMode.done;
    footIndicatorResult = CustomIndicatorResult.none;
    EventService.instance.dispatchEvent(kUpdateRefreshResultEvent);
  }
}
