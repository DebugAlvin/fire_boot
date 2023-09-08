import 'package:flutter/material.dart';

extension ButtonThemeDataExtension on ButtonThemeData {

  static final _borderRadius = Expando<BorderRadiusGeometry>();
  BorderRadiusGeometry? get borderRadius => _borderRadius[this];
  set borderRadius(BorderRadiusGeometry? value) {
    _borderRadius[this] = value;
  }

  static final _disableTextColor = Expando<Color>();
  Color get disableTextColor => _disableTextColor[this] ?? Colors.grey;
  set disableTextColor(Color value) {
    _disableTextColor[this] = value;
  }
  static final _horizontalPadding = Expando<double>();
  double get horizontalPadding => _horizontalPadding[this] ?? 0;
  set horizontalPadding(double value) {
    _horizontalPadding[this] = value;
  }

  static final _verticalPadding = Expando<double>();
  double get verticalPadding => _verticalPadding[this] ?? 0;
  set verticalPadding(double value) {
    _verticalPadding[this] = value;
  }

  static final _borderWith = Expando<double>();
  double get borderWith => _borderWith[this] ?? 0;
  set borderWith(double value) {
    _borderWith[this] = value;
  }

  static final _borderColor = Expando<Color>();
  Color get borderColor => _borderColor[this] ?? Colors.grey;
  set borderColor(Color value) {
    _borderColor[this] = value;
  }

  static final _disableBorderColor = Expando<Color>();
  Color get disableBorderColor => _disableBorderColor[this] ?? Colors.grey;
  set disableBorderColor(Color value) {
    _disableBorderColor[this] = value;
  }

  static final _whiteColor = Expando<Color>();
  Color get whiteColor => _whiteColor[this] ?? Colors.white;
  set whiteColor(Color value) {
    _whiteColor[this] = value;
  }

  static final _darkColor = Expando<Color>();
  Color get darkColor => _darkColor[this] ?? Colors.black;
  set darkColor(Color value) {
    _darkColor[this] = value;
  }

  static final _outLineDisableTextColor = Expando<Color>();
  Color get outLineDisableTextColor => _outLineDisableTextColor[this] ?? Colors.grey;
  set outLineDisableTextColor(Color value) {
    _outLineDisableTextColor[this] = value;
  }
}