import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/summary/figure_widget.dart';

class FiguresLayoutWidget extends StatelessWidget {
  const FiguresLayoutWidget({
    required this.useMobileLayout,
    super.key,
    this.portfolio,
  });

  final bool useMobileLayout;
  final PortfolioEntity? portfolio;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: EdgeInsets.only(
          left: useMobileLayout ? AppSizes.xlPadding : 0,
        ),
        child: Flex(
          direction: useMobileLayout ? Axis.vertical : Axis.horizontal,
          children: [
            if (!useMobileLayout) const Expanded(child: SizedBox()),
            FigureWidget(
              title: 'Balance',
              value: r'$' + portfolio!.balance.toStringAsFixed(2),
              useMobileLayout: useMobileLayout,
            ),
            getDivider(),
            FigureWidget(
              title: 'Profits',
              value: r'$' + portfolio!.profit.toStringAsFixed(2),
              figureState: FigureStateWidget(
                percent: portfolio!.profitPercentage,
                success: true,
                useMobileLayout: useMobileLayout,
              ),
              useMobileLayout: useMobileLayout,
            ),
            getDivider(),
            FigureWidget(
              title: 'Assets',
              value: portfolio!.assets.toString(),
              useMobileLayout: useMobileLayout,
            ),
          ],
        ),
      ),
    );
  }

  Widget getDivider() {
    if (useMobileLayout) {
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
