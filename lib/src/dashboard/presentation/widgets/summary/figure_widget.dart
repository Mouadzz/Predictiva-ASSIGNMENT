import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class FigureWidget extends StatelessWidget {
  const FigureWidget({
    required this.title,
    required this.value,
    required this.isMobileLayout,
    super.key,
    this.figureState,
  });

  final String title;
  final String value;
  final Widget? figureState;
  final bool isMobileLayout;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isMobileLayout
              ? AppSizes.lgPadding
              : SizeConfig.isTabletLayout
                  ? AppSizes.txlPadding
                  : AppSizes.nmxlPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: AppSizes.mdText,
                color: AppTheme.grey1,
              ),
            ),
            SizedBox(
              height: isMobileLayout ? AppSizes.xsPadding : AppSizes.lgPadding,
            ),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: isMobileLayout
                        ? AppSizes.lgText
                        : SizeConfig.isTabletLayout
                            ? AppSizes.nmdText
                            : AppSizes.xlText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (figureState != null)
                  Padding(
                    padding: EdgeInsets.only(
                      left: isMobileLayout
                          ? AppSizes.xsPadding
                          : AppSizes.smPadding,
                    ),
                    child: figureState,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
