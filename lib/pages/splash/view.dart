import 'package:fire_boot/base/getx/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant/app_values.dart';
import 'logic.dart';

const double bottomHeight = 90;

class SplashPage extends BaseView<SplashLogic> {
  SplashPage({Key? key,this.onFinish}) : super(key: key);
  Function(BuildContext context)? onFinish;

  @override
  Widget buildBody(BuildContext context) {
    //等待隐私协议弹窗确认
    controller.onFinish = (){
      if(onFinish != null) {
        onFinish!(context);
      }
    };
    return Container(
      color: Colors.white,
      alignment: Alignment.bottomCenter,
      child: Image.asset('assets/images/LaunchImage.png', width: 375, height: 812),
    );
    //  return Container(
    //   alignment: Alignment.bottomCenter,
    //   decoration: const BoxDecoration(color: Colors.white),
    //   child: Container(
    //     margin: const EdgeInsets.only(bottom: 11.25),
    //     width: ScreenUtil().screenWidth,
    //     height: bottomHeight,
    //     child: Image.asset('assets/images/LaunchImage.png'),
    //   ),
    // );
  }


  // Widget _buildLoading() {
  //   return Container(
  //     margin: const EdgeInsets.only(left: 0, right: 0, bottom: 100),
  //     alignment: Alignment.center,
  //     child: const CupertinoActivityIndicator(
  //       animating: true,
  //       radius: 15,
  //     ),
  //   );
  // }
  //
  // Widget _buildLogoName() {
  //   return Container(
  //     margin: const EdgeInsets.only(top: 120),
  //     alignment: Alignment.center,
  //     child: Column(
  //       children: [
  //         Image.asset(
  //           "assets/images/application_icon.png",
  //           fit: BoxFit.fitWidth,
  //           width: 110,
  //           height: 110,
  //         ),
  //         Container(
  //           margin: const EdgeInsets.only(top: 16),
  //           child: const Text(
  //             AppValues.appName,
  //             style: TextStyle(
  //                 fontSize: 36,
  //                 fontWeight: FontWeight.w500,
  //                 height: 1.2,
  //                 color: AppColors.textColorPrimary),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return null;
  }

}
