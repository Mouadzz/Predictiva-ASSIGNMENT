import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class TopNavigationWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const TopNavigationWidget({
    required this.isMobile,
    super.key,
  });

  final bool isMobile;

  @override
  Size get preferredSize => Size.fromHeight(
        isMobile
            ? 79
            : SizeConfig.isTablet
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
