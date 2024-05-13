import 'package:flutter/widgets.dart';
import 'package:predictiva/core/core.dart';

class FigureStateWidget extends StatelessWidget {
  const FigureStateWidget({
    required this.success,
    required this.percent,
    super.key,
  });

  final bool success;
  final int percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.dark2,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: success ? AppTheme.success : AppTheme.error),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/${success ? 'arrow-up-right' : 'arrow-down-left'}.png',
            width: 16,
            height: 16,
          ),
          const SizedBox(width: 4),
          Text(
            '$percent%',
            style: TextStyle(
              fontSize: 14,
              color: success ? AppTheme.success : AppTheme.error,
            ),
          ),
        ],
      ),
    );
  }
}
