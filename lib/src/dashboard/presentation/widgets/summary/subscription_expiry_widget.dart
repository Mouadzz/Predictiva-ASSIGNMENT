import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class SubscriptionExpiryWidget extends StatelessWidget {
  const SubscriptionExpiryWidget({required this.isMobileLayout, super.key});

  final bool isMobileLayout;

  @override
  Widget build(BuildContext context) {
    final iconSize = isMobileLayout ? AppSizes.mdIcon : AppSizes.lgIcon;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobileLayout ? AppSizes.txlPadding : AppSizes.dxlPadding,
      ),
      decoration: const BoxDecoration(
        color: AppTheme.dark2,
        border: Border(top: BorderSide(color: AppTheme.stroke)),
        borderRadius:
            BorderRadius.vertical(bottom: Radius.circular(AppSizes.lgRadius)),
      ),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: isMobileLayout ? AppSizes.dxlPadding : AppSizes.txlPadding,
            ),
            Image.asset(
              'assets/images/warning-circle.png',
              width: iconSize,
              height: iconSize,
            ),
            SizedBox(
              width: isMobileLayout ? AppSizes.xsPadding : AppSizes.smPadding,
            ),
            Flexible(
              child: Text(
                'This subscription expires in a month',
                style: TextStyle(
                  fontSize:
                      isMobileLayout ? AppSizes.mdText - 1 : AppSizes.mdText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
