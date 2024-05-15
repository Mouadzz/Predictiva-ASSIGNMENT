import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class TopNavigationWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const TopNavigationWidget({
    required this.isMobileLayout,
    super.key,
  });

  final bool isMobileLayout;

  @override
  Size get preferredSize => Size.fromHeight(
        isMobileLayout
            ? 79
            : SizeConfig.isTabletLayout
                ? 89
                : 99,
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        leading: const SizedBox(),
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
