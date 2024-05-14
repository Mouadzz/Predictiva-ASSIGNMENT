import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class FigureWidget extends StatelessWidget {
  const FigureWidget({
    required this.title,
    required this.value,
    required this.useMobileLayout,
    super.key,
    this.figureState,
  });

  final String title;
  final String value;
  final Widget? figureState;
  final bool useMobileLayout;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: useMobileLayout ? AppSizes.lgPadding : AppSizes.nmxlPadding,
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
              height: useMobileLayout ? AppSizes.xsPadding : AppSizes.lgPadding,
            ),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize:
                        useMobileLayout ? AppSizes.lgText : AppSizes.xlText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (figureState != null)
                  Padding(
                    padding: EdgeInsets.only(
                      left: useMobileLayout
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
