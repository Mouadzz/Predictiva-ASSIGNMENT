import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({required this.isMobileLayout, super.key});

  final bool isMobileLayout;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          top: isMobileLayout ? AppSizes.txlPadding : AppSizes.mxlPadding,
          bottom: isMobileLayout ? AppSizes.txlPadding : AppSizes.qxlPadding,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Robin,',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.xlText,
              ),
            ),
            SizedBox(height: AppSizes.xsPadding),
            Text(
              'Here is an overview of your account activities.',
              style: TextStyle(
                fontSize: AppSizes.mdText,
                color: AppTheme.grey1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
