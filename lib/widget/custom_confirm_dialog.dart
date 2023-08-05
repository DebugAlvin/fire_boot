import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:fire_boot/utils/route_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/app_themes.dart';


/// showDialog(context: context, builder: (builder) => CustomConfirmDialog(onConfirm: () => controller.closeLive(liveId)));
/// 常用验证框
class CustomConfirmDialog extends Dialog {

  String content;
  String cancelText;
  String confirmText;
  Function? onCancel;
  Function? onConfirm;

  CustomConfirmDialog({
    super.key,
    this.content = "确定删除这条视频吗？",
    this.cancelText = "取消",
    this.confirmText = "确定",
    this.onCancel,
    this.onConfirm
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Material(
        type: MaterialType.transparency,
        child: Center(
            child: GestureDetector(
                onTap: () {},
                child: Container(
                    width: 300.w,
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: AppThemes.appBarIconColorWhite,
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

                      Text(content, style: ThemeService().theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.normal)),

                      SizedBox(height: 35.h),

                      Row(mainAxisSize: MainAxisSize.min, children: [
                        GestureDetector(
                          onTap: () {
                            RouteUtil.popView();
                            if(onCancel != null) {
                              onCancel!();
                            }
                          },
                          child: Container(
                            width: 120.w,
                            height: 40.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1, color: AppThemes.textColorWhite)
                            ),
                            child: Text(cancelText, style: ThemeService().theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.normal)),
                          ),
                        ),

                        SizedBox(width: 14.w),

                        GestureDetector(
                          onTap: () {
                            RouteUtil.popView();
                            if(onConfirm != null) {
                              onConfirm!();
                            }
                          },
                          child: Container(
                            width: 120.w,
                            height: 40.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppThemes.bloodRed,
                            ),
                            child: Text(confirmText, style: ThemeService().theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.normal, color: AppThemes.appBarIconColorWhite)),
                          ),
                        )
                      ])


                    ])))),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

}

