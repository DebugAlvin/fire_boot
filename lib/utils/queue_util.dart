import 'dart:async';

class QueueUtil {
  /// 用map key存储多个QueueUtil单例,目的是隔离多个类型队列任务互不干扰
  /// Use map key to store multiple QueueUtil singletons, the purpose is to isolate multiple types of queue tasks without interfering with each other
  static Map<String, QueueUtil> _instance = Map<String, QueueUtil>();

  static QueueUtil? get(String key) {
    if (_instance[key] == null) {
      _instance[key] = QueueUtil._();
    }
    return _instance[key];
  }

  QueueUtil._() {
    /// 初始化代码
  }

  List<_TaskInfo> _taskList = [];
  bool _isTaskRunning = false;
  int _mId = 0;
  bool _isCancelQueue = false;

  Future<_TaskInfo> addTask(Function doSomething) {
    _isCancelQueue = false;
    _mId++;
    _TaskInfo taskInfo = _TaskInfo(_mId, doSomething);

    /// 创建future
    Completer<_TaskInfo> taskCompleter = Completer<_TaskInfo>();

    /// 创建当前任务stream
    StreamController<_TaskInfo> streamController = StreamController();
    taskInfo.controller = streamController;

    /// 添加到任务队列
    _taskList.add(taskInfo);

    /// 当前任务的stream添加监听
    streamController.stream.listen((_TaskInfo completeTaskInfo) {
      if (completeTaskInfo.id == taskInfo.id) {
        taskCompleter.complete(completeTaskInfo);
        streamController.close();
      }
    });

    /// 触发任务
    _doTask();

    return taskCompleter.future;
  }

  void cancelTask() {
    _taskList = [];
    _isCancelQueue = true;
    _mId = 0;
    _isTaskRunning = false;
  }

  _doTask() async {
    if (_isTaskRunning) return;
    if (_taskList.isEmpty) return;

    /// 取任务
    _TaskInfo taskInfo = _taskList[0];
    _isTaskRunning = true;

    /// 模拟执行任务
    await taskInfo.doSomething?.call();

    taskInfo.controller?.sink.add(taskInfo);

    if (_isCancelQueue) return;

    /// 出队列
    _taskList.removeAt(0);
    _isTaskRunning = false;

    /// 递归执行任务
    _doTask();
  }
}

class _TaskInfo {
  int id; // 任务唯一标识
  Function? doSomething;
  StreamController<_TaskInfo>? controller;

  _TaskInfo(this.id, this.doSomething, {this.controller});
}