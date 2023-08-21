import 'package:fire_boot/constant/app_cache_key.dart';
import 'package:fire_boot/model/user.dart';
import 'package:fire_boot/routes/routes.dart';
import 'package:fire_boot/services/api/api_service.dart';
import 'package:fire_boot/utils/route_util.dart';
import 'package:fire_boot/utils/sp_util.dart';

/// 处理账号登陆相关的问题
class AccountService {
  // 如果一个函数的构造方法并不总是返回一个新的对象的时候，可以使用factory，
  // 比如从缓存中获取一个实例并返回或者返回一个子类型的实例

  // 工厂方法构造函数
  factory AccountService() => _getInstance();

  // instance的getter方法，通过AccountService.instance获取对象
  static AccountService get sharedInstance => _getInstance();

  // 静态变量_instance，存储唯一对象
  static AccountService? _instance;

  //当前的user对象
  User? _user;

  final listeners = <AccountServiceListener>[];

  // 私有的命名式构造方法，通过它可以实现一个类可以有多个构造函数，
  // 子类不能继承internal不是关键字，可定义其他名字
  AccountService._internal() {
    // 初始化
    initAsync();
  }

  // 获取对象
  static AccountService _getInstance() {
    _instance ??= AccountService._internal();
    return _instance!;
  }

  /// 异步初始化
  Future initAsync() async {
    final userMap = SPUtil().getJson(CacheKey.userDataKey);
    if (userMap != null) {
      _user = User.fromJson(userMap!);
    }
  }

  /// 当前登陆的User
  User? get currentUser {
    // _user ??= SpUtil.getObj(CacheKey.userDataKey, (m) => User.fromJson(m as Map<String, dynamic>));
    if (_user == null) {
      final userMap = SPUtil().getJson(CacheKey.userDataKey);
      if (userMap != null) {
        _user = User.fromJson(userMap!);
      }
    }
    return _user;
  }

  Future<void> addListener(AccountServiceListener listener) async {
    if (listeners.contains(listener)) return;
    listeners.add(listener);
  }

  Future<void> removeListener(AccountServiceListener listener) async {
    if (!listeners.contains(listener)) return;
    listeners.remove(listener);
  }

  /// 用户登陆
  ///
  /// * [user] 登陆用户的信息
  void loginUser(User user) {
    for (AccountServiceListener listener in listeners) {
      if (listener.onLoginSuccess != null) {
        listener.onLoginSuccess!(user);
      }
    }
    // 存储用户数据
    saveUserInfo(user);
  }

  void saveUserInfo(User user) {
    if (_user != null && _user?.id == user.id && user.token == null) {
      user.token = _user!.token;
      _user = user;
    } else {
      _user = user;
    }
    if(_user != null) {
      SPUtil().setJson(CacheKey.userDataKey, _user!.toJson());
    }
  }

  Future<void> refreshUserInfo() async {
    String token = AccountService.sharedInstance.currentUser?.token ?? '';
    if (token.isEmpty) return;
    final response = await ApiService.instance.getUserInfo(
        token: token,
        success: (user) {
          AccountService.sharedInstance.loginUser(user);
        },
        fail: (int code, String msg) {});
    if (response.ok) {
      for (AccountServiceListener listener in listeners) {
        if (listener.onUserInfoChange != null) {
          listener.onUserInfoChange!(_user!);
        }
      }
    }
  }

  void onUserTokenInvalid() {
    AccountService.sharedInstance.logoutUser();
  }

  Future<void> pushToLoginPage() async {
    RouteUtil.pushToView(Routes.loginPage);
  }

  /// 退出登录
  void logoutUser() {
    // // 清除账号信息
    for (AccountServiceListener listener in listeners) {
      if (listener.onLogout != null) {
        listener.onLogout;
      }
    }
    _user = null;
    SPUtil().remove(CacheKey.userDataKey);
  }

  bool isLogin() {
    return _user != null && _user?.token != null;
  }
}

typedef AccountServiceOnUserInfoChange = void Function(User model);
typedef AccountServiceOnLoginSuccess = void Function(User model);
typedef AccountServiceOnLogout = Function();

class AccountServiceListener {
  AccountServiceOnUserInfoChange? onUserInfoChange;
  AccountServiceOnLoginSuccess? onLoginSuccess;
  AccountServiceOnLogout? onLogout;

  AccountServiceListener({
    this.onUserInfoChange,
    this.onLogout,
    this.onLoginSuccess,
  });
}
