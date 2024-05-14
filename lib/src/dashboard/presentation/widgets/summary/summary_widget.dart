import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/summary/figure_state_widget.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({required this.useMobileLayout, super.key});

  final bool useMobileLayout;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.dark4,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.stroke),
      ),
      child: Column(
        children: [
          figures(),
          subscriptionExpiry(),
        ],
      ),
    );
  }

  Widget figures() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            figure(title: 'Balance', value: r'$616.81'),
            const Divider(
              thickness: 1,
              height: 0,
              endIndent: 12,
            ),
            figure(
              title: 'Profits',
              value: r'$86.03',
              figureState: const FigureStateWidget(
                percent: 8,
                success: true,
              ),
            ),
            const Divider(
              thickness: 1,
              height: 0,
              endIndent: 12,
            ),
            figure(title: 'Assets', value: '12'),
          ],
        ),
      );

  Widget figure({
    required String title,
    required String value,
    Widget? figureState,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: AppTheme.grey1,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (figureState != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: figureState,
                  )
              ],
            ),
          ],
        ),
      );

  Widget subscriptionExpiry() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        decoration: const BoxDecoration(
          color: AppTheme.dark2,
          border: Border(top: BorderSide(color: AppTheme.stroke)),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/warning-circle.png',
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 8),
            const Text(
              'This subscription expires in a month',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
}
