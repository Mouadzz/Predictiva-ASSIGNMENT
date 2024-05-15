import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class FiguresLayoutWidget extends StatelessWidget {
  const FiguresLayoutWidget({
    required this.isMobileLayout,
    super.key,
    this.portfolio,
  });

  final bool isMobileLayout;
  final PortfolioEntity? portfolio;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.only(
          left: isMobileLayout ? AppSizes.xlPadding : 0,
        ),
        child: Flex(
          direction: isMobileLayout ? Axis.vertical : Axis.horizontal,
          children: [
            if (!isMobileLayout) const Expanded(child: SizedBox()),
            FigureWidget(
              title: 'Balance',
              value: r'$' + portfolio!.balance.toStringAsFixed(2),
              isMobileLayout: isMobileLayout,
            ),
            getDivider(),
            FigureWidget(
              title: 'Profits',
              value: r'$' + portfolio!.profit.toStringAsFixed(2),
              figureState: FigureStateWidget(
                percent: portfolio!.profitPercentage,
                success: true,
                isMobileLayout: isMobileLayout,
              ),
              isMobileLayout: isMobileLayout,
            ),
            getDivider(),
            FigureWidget(
              title: 'Assets',
              value: portfolio!.assets.toString(),
              isMobileLayout: isMobileLayout,
            ),
          ],
        ),
      ),
    );
  }

  Widget getDivider() {
    if (isMobileLayout) {
      return const Divider(endIndent: AppSizes.smPadding);
    } else {
      return const Expanded(
        child: VerticalDivider(
          endIndent: AppSizes.qxlPadding,
          indent: AppSizes.qxlPadding,
        ),
      );
    }
  }
}
