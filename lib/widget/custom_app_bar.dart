import 'package:fire_boot/widget/custom_close_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fire_boot/services/theme_service.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? appBarTitleText;
  final List<Widget>? actions;
  final bool showLeading;
  final Widget? leading;
  final Widget? titleView;
  final Color? backgroundColor;
  final double? leadingWidth;
  final double? titleSpacing;
  final AppBarTheme? appBarTheme;
  final double? elevation;
  final double? height;

  CustomAppBar({
    Key? key,
    this.appBarTitleText,
    this.actions,
    this.showLeading = true,
    this.leading,
    this.titleView,
    this.backgroundColor,
    this.leadingWidth,
    this.titleSpacing,
    this.appBarTheme,
    this.elevation = 0,
    this.height,
  }) : super(key: key);

  @override
  Size get preferredSize {
    return height != null
        ? Size(AppBar().preferredSize.width, height!)
        : AppBar().preferredSize;
  }

  @override
  Widget build(BuildContext context) {
    final theme = appBarTheme ?? ThemeService().theme.appBarTheme;
    return SizedBox(
      height: preferredSize.height + MediaQuery.of(context).padding.top,
      child: AppBar(
        iconTheme: theme.iconTheme,
        backgroundColor: backgroundColor ?? theme.backgroundColor,
        leading: leading ?? const CustomCloseButton(style: CustomCloseButtonStyle.outlined,),
        leadingWidth: leadingWidth,
        elevation: elevation,
        automaticallyImplyLeading: showLeading,
        actions: actions,
        titleSpacing: titleSpacing,
        centerTitle: true,
        title: titleView ??
            Text(
              appBarTitleText ?? '',
              style: theme.titleTextStyle,
            ),
      ),
    );
  }

  static fillHeight(BuildContext context) {
    return AppBar().preferredSize.height + MediaQuery.of(context).padding.top;
  }
}
