import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late LayoutType layoutType;
  static late MediaQueryData _mediaQueryData;

  void init(BuildContext context, Orientation orientation) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    // to decide whether we want mobile landscape to be [Desktop Layout]
    // _mediaQueryData.size.shortestSide < 600;
    if ((orientation == Orientation.portrait && screenWidth < 600) ||
        (orientation == Orientation.landscape && screenWidth < 600)) {
      layoutType = LayoutType.mobile;
    } else {
      layoutType = LayoutType.desktop;
    }
  }

  static bool get useMobileLayout => layoutType == LayoutType.mobile;
}

enum LayoutType { mobile, desktop }
