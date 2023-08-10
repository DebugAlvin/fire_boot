import 'package:flutter/material.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:lottie/lottie.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget(
      {Key? key, this.width, this.height, this.alignment = Alignment.center, this.color, this.text = "暂无数据", this.imgPath = "assets/images/data_empty.png"})
      : super(key: key);
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Color? color;
  final String? text;
  final String? imgPath;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
          width: width,
          height: height,
          alignment: alignment,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              imgPath != null && imgPath != "" ? Container(margin: const EdgeInsets.only(bottom: 37), child: Image.asset(imgPath!, width: 178, height: 130)) : Lottie.asset(
                'assets/lottie/refresh_empty_page.json',
                repeat: true,
                reverse: true,
                animate: true,
                width: 200,
                height: 180,
              ),
              Text(
                text!,
                style: ThemeService().theme.textTheme.labelLarge,
              ),
            ],
          )),
    );
  }
}
