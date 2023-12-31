import 'package:fire_boot/utils/route_util.dart';
import 'package:fire_boot/widget/button/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:flutter_svg/svg.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? appBarTitleText;
  final List<CustomIconButton>? actions;
  final bool showLeading;
  final CustomIconButton? leading;
  final Widget? titleView;
  final Color? backgroundColor;
  final double? leadingWidth;
  final double? titleSpacing;
  final AppBarTheme? appBarTheme;
  final double? elevation;
  final double? height;
  final VoidCallback? onBackTap;

  const CustomAppBar({
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
    this.onBackTap,
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
            : (leading ?? _buildBackIconButton(theme.iconTheme!)),
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

  _buildBackIconButton(IconThemeData themeData) {
    return CustomIconButton(
      onTap: () {
        if (onBackTap != null) {
          onBackTap!();
        } else {
          RouteUtil.popView();
        }
      },
      widgetWidth: 44,
      widgetHeight: preferredSize.height,
      iconWidget: SvgPicture.asset(
        'assets/svg/ic_normal_back.svg',
        width: 18,
        height: 18,
        color: themeData.color,
      ),
      iconThemeData: themeData,
    );
  }
}
