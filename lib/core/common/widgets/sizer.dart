import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class Sizer extends StatelessWidget {
  const Sizer({required this.builder, super.key});

  final Widget Function() builder;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        SizeConfig().init(context, orientation);
        return builder();
      },
    );
  }
}
