enum AppFont {
  nomal,
  roboto,
}


extension AppFontExtension on AppFont {

  String get bold {
    switch (this) {
      case AppFont.nomal:
        return 'bold';
      case AppFont.roboto:
        return 'Roboto-Bold';
      default:
        return 'bold';
    }
  }

  String get rgular {
    switch (this) {
      case AppFont.nomal:
        return 'rgular';
      case AppFont.roboto:
        return 'Roboto-Regular';
      default:
        return 'rgular';
    }
  }

}