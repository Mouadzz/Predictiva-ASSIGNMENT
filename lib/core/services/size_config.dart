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

    if (width < 800) {
      layoutType = LayoutType.mobile;
    } else {
      layoutType = LayoutType.desktop;
    }
  }

  static bool get useMobileLayout => layoutType == LayoutType.mobile;
}

enum LayoutType { mobile, desktop }
