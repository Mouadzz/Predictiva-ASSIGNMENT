import 'package:flutter/widgets.dart';
import 'package:predictiva/core/core.dart';

class FigureStateWidget extends StatelessWidget {
  const FigureStateWidget({
    required this.success,
    required this.percent,
    required this.isMobileLayout,
    super.key,
  });

  final bool success;
  final int percent;
  final bool isMobileLayout;

  @override
  Widget build(BuildContext context) {
    final iconSize = isMobileLayout ? AppSizes.smIcon : AppSizes.mdIcon;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.xsPadding,
        vertical: AppSizes.dxsPadding,
      ),
      decoration: BoxDecoration(
        color: AppTheme.dark2,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: success ? AppTheme.success : AppTheme.error),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/${success ? 'arrow-up-right' : 'arrow-down-left'}.png',
            width: iconSize,
            height: iconSize,
          ),
          const SizedBox(width: AppSizes.dxsPadding),
          Text(
            '$percent%',
            style: TextStyle(
              fontSize: AppSizes.smText,
              color: success ? AppTheme.success : AppTheme.error,
            ),
          ),
        ],
      ),
    );
  }
}
