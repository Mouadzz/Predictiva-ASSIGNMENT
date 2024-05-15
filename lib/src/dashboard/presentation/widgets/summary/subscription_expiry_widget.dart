import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class SubscriptionExpiryWidget extends StatelessWidget {
  const SubscriptionExpiryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (_, __) {
        final isMobile = SizeConfig.isMobile;
        final iconSize = isMobile ? AppSizes.mdIcon : AppSizes.lgIcon;

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? AppSizes.txlPadding : AppSizes.dxlPadding,
          ),
          decoration: const BoxDecoration(
            color: AppTheme.dark2,
            border: Border(top: BorderSide(color: AppTheme.stroke)),
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(AppSizes.lgRadius)),
          ),
          child: Center(
            child: Row(
              children: [
                SizedBox(
                  width: isMobile ? AppSizes.dxlPadding : AppSizes.txlPadding,
                ),
                Image.asset(
                  'assets/images/warning-circle.png',
                  width: iconSize,
                  height: iconSize,
                ),
                SizedBox(
                  width: isMobile ? AppSizes.xsPadding : AppSizes.smPadding,
                ),
                Flexible(
                  child: Text(
                    'This subscription expires in a month',
                    style: TextStyle(
                      fontSize:
                          isMobile ? AppSizes.mdText - 1 : AppSizes.mdText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
