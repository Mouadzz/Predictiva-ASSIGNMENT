import 'package:flutter/material.dart';

class TopNavigationWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const TopNavigationWidget({required this.useMobileLayout, super.key});

  final bool useMobileLayout;

  @override
  Size get preferredSize => Size.fromHeight(useMobileLayout ? 79 : 99);

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
