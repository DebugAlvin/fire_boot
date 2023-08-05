import 'package:flutter/material.dart';

extension ButtonThemeDataExtension on ButtonThemeData {

  static final _borderRadius = Expando<BorderRadiusGeometry>();
  BorderRadiusGeometry? get borderRadius => _borderRadius[this];
  set borderRadius(BorderRadiusGeometry? value) {
    _borderRadius[this] = value;
  }

  static final _disableTextColor = Expando<Color>();
  Color? get disableTextColor => _disableTextColor[this];
  set disableTextColor(Color? value) {
    _disableTextColor[this] = value;
  }

  static final _disableBackgroundColor = Expando<Color>();
  Color? get disableBackgroundColor => _disableBackgroundColor[this];
  set disableBackgroundColor(Color? value) {
    _disableBackgroundColor[this] = value;
  }

  static final _horizontalPadding = Expando<double>();
  double get horizontalPadding => _horizontalPadding[this] ?? 0;
  set horizontalPadding(double value) {
    _horizontalPadding[this] = value;
  }


}