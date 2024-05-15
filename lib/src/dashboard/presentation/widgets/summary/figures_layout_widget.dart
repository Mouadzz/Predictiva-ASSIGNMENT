import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class FiguresLayoutWidget extends StatelessWidget {
  const FiguresLayoutWidget({
    super.key,
    this.portfolio,
  });

  final PortfolioEntity? portfolio;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (_, __) {
        final isMobile = SizeConfig.isMobile;
        return IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.only(
              left: isMobile ? AppSizes.xlPadding : 0,
            ),
            child: Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              children: [
                if (!isMobile) const Expanded(child: SizedBox()),
                FigureWidget(
                  title: 'Balance',
                  value: r'$' + portfolio!.balance.toStringAsFixed(2),
                  isMobile: isMobile,
                ),
                getDivider(isMobile: isMobile),
                FigureWidget(
                  title: 'Profits',
                  value: r'$' + portfolio!.profit.toStringAsFixed(2),
                  figureState: FigureStateWidget(
                    percent: portfolio!.profitPercentage,
                    success: true, // todo
                    isMobile: isMobile,
                  ),
                  isMobile: isMobile,
                ),
                getDivider(isMobile: isMobile),
                FigureWidget(
                  title: 'Assets',
                  value: portfolio!.assets.toString(),
                  isMobile: isMobile,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget getDivider({required bool isMobile}) {
    if (isMobile) {
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
