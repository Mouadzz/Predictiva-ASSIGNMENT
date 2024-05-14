//import 'package:graitor/Extensions/num_extension.dart';

// Project imports:

//https://github.com/TechnoUrmish/Sizer/blob/master/lib/extension.dart

import 'package:predictiva/core/core.dart';

extension SizeExtension on num {
  /// Calculates the width and height depending on the device's screen size
  /// Eg: 20.w -> will take 20% of the screen's width
  /// Eg: 20.h -> will take 20% of the screen's height

  double get w => this * SizeConfig.screenWidth / 100;
  double get h => this * SizeConfig.screenHeight / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * (SizeConfig.screenWidth / 3) / 100;
}
