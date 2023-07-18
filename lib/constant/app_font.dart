enum AppFont {
  normal,
  roboto,
}


extension AppFontExtension on AppFont {

  String get bold {
    switch (this) {
      case AppFont.normal:
        return 'bold';
      case AppFont.roboto:
        return 'Roboto-Bold';
      default:
        return 'bold';
    }
  }

  String get regular {
    switch (this) {
      case AppFont.normal:
        return 'regular';
      case AppFont.roboto:
        return 'Roboto-Regular';
      default:
        return 'regular';
    }
  }

}