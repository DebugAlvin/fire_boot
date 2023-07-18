import 'package:fire_boot/widget/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fire_boot/constant/app_themes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyDialog extends StatefulWidget {
  const PrivacyPolicyDialog(
      {super.key,
      required this.onConfirm,
      required this.onCancel,
      required this.onRegister,
      required this.onPrivater});

  //注册协议点击回调
  final VoidCallback onRegister;

  //隐私政策协议点击回调
  final VoidCallback onPrivater;

  //完成流程回调
  final VoidCallback onConfirm;

  //拒绝按钮的回调
  final VoidCallback onCancel;

  @override
  State<StatefulWidget> createState() => _PrivacyPolicyDialogState();
}

class _PrivacyPolicyDialogState extends State<PrivacyPolicyDialog> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppThemes.milkWhite,
            borderRadius: BorderRadius.all(Radius.circular(24.w)),
          ),
          width: 280.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 24.w, bottom: 24.w),
                child: Text("个人信息保护指引",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppThemes.appBarTextColorDark, fontSize: 18.w)),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      children: [
                        Text(
                          "欢迎使用普泽基金应用！我们将通过",
                          style: TextStyle(
                              color: AppThemes.textColorSecondary,
                              fontSize: 14.w),
                        ),
                      ],
                    ),
                  )),
              Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            widget.onRegister();
                          },
                          child: Text(
                            "《注册服务协议》",
                            style: TextStyle(
                                fontSize: 14.w, color: AppThemes.primaryColor),
                          ),
                        ),
                        Text(
                          "、",
                          style: TextStyle(
                              color: AppThemes.textColorSecondary,
                              fontSize: 14.w),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            widget.onPrivater();
                          },
                          child: Text(
                            "《隐私政策》",
                            style: TextStyle(
                                fontSize: 14.w, color: AppThemes.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 1.w, left: 24.w, right: 24.w),
                child: Text(
                    "帮助您了解我们收集、使用、存储和共享个人信息的情况，了解您的相关权利。\n\n为了保证您更好的体验，可能需要获取通知权限、电话权限、相机权限、存储权限、设备信息。当开启权限后方可使用相关功能。\n\n请仔细阅读，如您同意，请点击下方同意按钮以接受我们的服务。",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: AppThemes.textColorSecondary, fontSize: 14.w)),
              ),
              _buildAgreeButton(),
              _buildCancelButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    return CustomButton(
      width: double.infinity,
      height: 40.w,
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      borderRadius: BorderRadius.all(Radius.circular(22.w)),
      onPressed: () => widget.onCancel(),
      child: Text('拒绝',
          style:
              TextStyle(color: AppThemes.textColorSecondary, fontSize: 14.w)),
    );
  }

  Widget _buildAgreeButton() {
    return CustomButton(
      onPressed: () => widget.onConfirm(),
      width: double.infinity,
      height: 40.w,
      margin: const EdgeInsets.only(top: 36, left: 25, right: 25),
      useAccentColor: true,
      borderRadius: BorderRadius.all(Radius.circular(22.w)),
      child: Text('同意', style: TextStyle(color: Colors.white, fontSize: 14.w)),
    );
  }
}
