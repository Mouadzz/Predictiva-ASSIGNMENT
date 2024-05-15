import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class FigureWidget extends StatelessWidget {
  const FigureWidget({
    required this.title,
    required this.value,
    required this.isMobile,
    super.key,
    this.figureState,
  });

  final String title;
  final String value;
  final Widget? figureState;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isMobile
              ? AppSizes.lgPadding
              : SizeConfig.isTablet
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
              height: isMobile ? AppSizes.xsPadding : AppSizes.lgPadding,
            ),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: isMobile
                        ? AppSizes.lgText
                        : SizeConfig.isTablet
                            ? AppSizes.nmdText
                            : AppSizes.xlText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (figureState != null)
                  Padding(
                    padding: EdgeInsets.only(
                      left: isMobile ? AppSizes.xsPadding : AppSizes.smPadding,
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
