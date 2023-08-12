import 'package:fire_boot/constant/app_values.dart';
import 'branch.dart';

class BranchService {
  static BranchService? _instance;
  static BranchService _getInstance() {
    _instance ??= BranchService();
    return _instance!;
  }
  static BranchService get instance => _getInstance();

  late Branch current;

  BranchService() {
    current = AppValues.defaultBranch;
  }

  ///切换分支
  void switchBranch(Branch branch) {
    current = branch;
  }
}
