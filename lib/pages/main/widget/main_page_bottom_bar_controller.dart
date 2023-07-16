import 'package:flutter/material.dart';
class MainPageBottomBarController  {
  ValueChanged<int>? selectedMenuTap;
  void selectedAtIndex(int code) {
    selectedMenuTap!(code);
  }
}
