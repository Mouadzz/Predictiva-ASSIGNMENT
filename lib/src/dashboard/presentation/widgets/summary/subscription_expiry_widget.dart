import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class SubscriptionExpiryWidget extends StatelessWidget {
  const SubscriptionExpiryWidget({required this.useMobileLayout, super.key});

  final bool useMobileLayout;

  @override
  Widget build(BuildContext context) {
    final iconSize = useMobileLayout ? AppSizes.mdIcon : AppSizes.lgIcon;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: useMobileLayout ? AppSizes.dxlPadding : AppSizes.txlPadding,
        vertical: useMobileLayout ? AppSizes.txlPadding : AppSizes.dxlPadding,
      ),
      decoration: const BoxDecoration(
        color: AppTheme.dark2,
        border: Border(top: BorderSide(color: AppTheme.stroke)),
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(AppSizes.lgRadius)),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/warning-circle.png',
            width: iconSize,
            height: iconSize,
          ),
          SizedBox(
            width: useMobileLayout ? AppSizes.xsPadding : AppSizes.smPadding,
          ),
          const Text(
            'This subscription expires in a month',
            style: TextStyle(fontSize: AppSizes.mdText),
          ),
        ],
      ),
    );
  }
}