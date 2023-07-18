import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';

/// @class : KeyboardUtils
/// @name : alvin
/// @description :软键盘相关工具类
class KeyboardUtils {
  ///隐藏软键盘
  ///[context] 上下文
  static hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  /// 三方键盘配置
  static KeyboardActionsConfig getKeyboardConfig(
      BuildContext context, List<FocusNode> list) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: List.generate(
          list.length,
          (i) => KeyboardActionsItem(
                focusNode: list[i],
                toolbarButtons: [
                  (node) {
                    return GestureDetector(
                      onTap: () => node.unfocus(),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: <Widget>[
                          Container(color: Colors.transparent, width: 100),
                          const Positioned(right: 15, child: Text('关闭')),
                        ],
                      ),
                    );
                  },
                ],
              )),
    );
  }
}
