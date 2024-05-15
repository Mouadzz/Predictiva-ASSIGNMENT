import 'package:flutter/material.dart';

class SizeConfig {
  static double maxWidth = 1536;

  static late double width;
  static late double height;
  static late double shortestSide;
  static late LayoutType layoutType;
  static late MediaQueryData _mediaQueryData;

  void init(BuildContext context, Orientation orientation) {
    _mediaQueryData = MediaQuery.of(context);

    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;

    // to decide whether desktop layout should be used in mobile landscape
    if (width < 750) {
      layoutType = LayoutType.mobile;
    } else if (width >= 750 && width < 1024) {
      layoutType = LayoutType.tablet;
    } else {
      layoutType = LayoutType.desktop;
    }
  }

  static bool get isMobileLayout => layoutType == LayoutType.mobile;
  static bool get isTabletLayout => layoutType == LayoutType.tablet;
  static bool get isDesktopLayout => layoutType == LayoutType.desktop;
}

enum LayoutType { mobile, tablet, desktop }
