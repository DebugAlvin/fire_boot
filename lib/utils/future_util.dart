import 'dart:async';

enum TaskStatus { init, success, fail }

class FutureUtil {
  /// Execute a list of tasks and return true if all tasks are executed successfully.
  /// Otherwise, return false.
  static Future<bool> executeTasks(Iterable<Future<bool>> tasks) async {
    bool hasError = false;
    await Future.wait(tasks).then((results) {
      results.forEach((result) {
        if (result == false) {
          hasError = true;
        }
      });
    });
    return !hasError;
  }

  /// 异步的同时执行tasks中的Future
  /// 有任何一个Future返回false，则直接返回false
  /// 等待所有的Future返回true，则返回true
  static Future<bool> executeTasksAsync(List<Future<bool>> tasks) async {
    List<TaskStatus> completionStatus = List.filled(tasks.length, TaskStatus.init);

    final controller = StreamController<bool>();
    final stream = controller.stream;

    for (int i = 0; i < tasks.length; i++) {
      tasks[i].then((success) {
        completionStatus[i] = success ? TaskStatus.success : TaskStatus.fail;
        // print("tasks[$i] result: $success");
        if (completionStatus.contains(TaskStatus.fail)) {
          controller.add(false); // 有任务失败，传递 false
        } else if (!completionStatus.contains(TaskStatus.init)) {
          controller.add(true); // 所有任务完成且无失败，传递 true
        }
      });
    }

    return await stream.first;
  }
}
