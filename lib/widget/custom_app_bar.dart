import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/widget/custom_app_bar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        leading: showLeading == false
            ? null
            : (leading ??
                const CustomAppBarIconButton(
                  padding: EdgeInsets.only(left: AppValues.defaultPadding),
                  style: CustomAppBarIconStyle.back,
                )),
        leadingWidth: leadingWidth,
        elevation: elevation,
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
}
