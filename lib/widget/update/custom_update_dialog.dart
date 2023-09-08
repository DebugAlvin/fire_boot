import 'package:fire_boot/constant/app_themes.dart';
import 'package:fire_boot/constant/app_values.dart';
import 'package:fire_boot/services/event/event_service.dart';
import 'package:fire_boot/services/theme/theme_service.dart';
import 'package:fire_boot/utils/route_util.dart';
import 'package:fire_boot/widget/button/custom_button.dart';
import 'package:fire_boot/widget/button/cutom_big_main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_update_controller.dart';

const kAppUpdateProgressEvent = 'kAppUpdateProgressEvent';

class CustomUpdateDialog extends StatefulWidget {
  final String title;
  final String remark;
  final bool canForceUpdate;
  final Function()? onCancel;
  final Function() onConfirm;
  final ThemeData? themeData;
  final CustomUpdateController controller;

  const CustomUpdateDialog({
    super.key,
    required this.title,
    required this.remark,
    required this.canForceUpdate,
    this.onCancel,
    required this.onConfirm,
    required this.controller,
    this.themeData,
  });

  @override
  _CustomUpdateDialogState createState() => _CustomUpdateDialogState();
}

class _CustomUpdateDialogState extends State<CustomUpdateDialog>
    with EventListener {
  @override
  initState() {
    super.initState();
    EventService.instance.addListener(kAppUpdateProgressEvent, this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    EventService.instance.removeListener(kAppUpdateProgressEvent, this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultTheme = widget.themeData ?? ThemeService().theme;
    final lightTheme = ThemeService.instance.lightTheme;
    return WillPopScope(
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            height: 524,
            child: Stack(
              children: [
                Positioned(
                  top: 126,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 400,
                    padding: const EdgeInsets.only(top: 95),
                    decoration: BoxDecoration(
                        color: lightTheme.colorScheme.surface,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Column(
                      children: [
                        _buildTitleView(defaultTheme),
                        Expanded(
                          child: _buildContentView(defaultTheme),
                        ),
                        _buildConfirmView(defaultTheme),
                      ],
                    ),
                  ),
                ),
                Image.asset('assets/images/home_bulletin_ic.png',
                    width: double.infinity, height: 220, fit: BoxFit.fill),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        if (widget.canForceUpdate) {
          return await Future.value(true);
        } else {
          return await Future.value(false);
        }
      },
    );
  }

  _buildTitleView(ThemeData themeData) {
    return Text(
      widget.title,
      style: themeData.textTheme.headlineSmall
          ?.copyWith(color: themeData.colorScheme.primary),
    );
  }

  _buildContentView(ThemeData themeData) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Text(
            widget.remark,
            style: TextStyle(
              color: themeData.colorScheme.secondary,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  _buildConfirmView(ThemeData themeData) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Visibility(
              visible: !widget.controller.startDownLoad,
              child: CustomBigMainButton(
                title: ' 立即更新',
                onTap: () => widget.onConfirm(),
              ),
            ),
            Visibility(
              visible:
                  !widget.controller.startDownLoad && widget.canForceUpdate,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: AppValues.smallPadding,
                ),
                child: CustomButton(
                  title: '跳过更新',
                  textColor: AppThemes.textColorGrey,
                  onTap: () {
                    if (widget.onCancel != null) {
                      widget.onCancel!();
                    } else {
                      RouteUtil.popView();
                    }
                  },
                  constraints: const BoxConstraints(minHeight: 44),
                ),
              ),
            ),
            Visibility(
              visible: widget.controller.startDownLoad,
              child: Column(
                children: [
                  Container(
                    height: 12,
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.black26,
                        valueColor: AlwaysStoppedAnimation(
                            themeData.colorScheme.primary),
                        value: widget.controller.progress,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      widget.controller.stateText,
                      style: themeData.textTheme.bodyMedium
                          ?.copyWith(color: AppThemes.secondaryColor),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: AppValues.extraLargePadding,
            ),
          ],
        ));
  }

  @override
  void onEvent(String eventId, event) {
    // TODO: implement onEvent
    if (eventId == kAppUpdateProgressEvent) {
      setState(() {});
    }
  }
}

Future<void> showCustomUpdateDialog({
  required BuildContext context,
  required String title,
  required String remark,
  required bool canForceUpdate,
  required CustomUpdateController controller,
  Function()? onCancel,
  required Function() onConfirm,
}) async {
  await showDialog(
      barrierDismissible: canForceUpdate,
      context: context,
      builder: (context) {
        return CustomUpdateDialog(
          title: title,
          remark: remark,
          canForceUpdate: canForceUpdate,
          onCancel: onCancel,
          onConfirm: onConfirm,
          controller: controller,
        );
      });
}
