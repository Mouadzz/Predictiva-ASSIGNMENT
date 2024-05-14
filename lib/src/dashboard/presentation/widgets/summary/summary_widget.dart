import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class SummaryWidget extends StatefulWidget {
  const SummaryWidget({required this.useMobileLayout, super.key});

  final bool useMobileLayout;

  @override
  State<SummaryWidget> createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends State<SummaryWidget> {
  PortfolioEntity? portfolio;

  @override
  void initState() {
    context.read<DashboardBloc>().add(GetPortfolioEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is PortfolioError) {
          showSnackBar(
            context,
            'Failed to load portfolio:\n${state.failure.message}',
          );
        }

        if (state is PortfolioLoaded) {
          portfolio = state.newPortfolio;
        }
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.dark4,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.stroke),
          ),
          child: portfolio != null
              ? Column(
                  children: [
                    figures(),
                    subscriptionExpiry(),
                  ],
                )
              : const SizedBox(),
        );
      },
    );
  }

  Widget figures() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            figure(
              title: 'Balance',
              value: r'$' + portfolio!.balance.toStringAsFixed(2),
            ),
            const Divider(endIndent: 12),
            figure(
              title: 'Profits',
              value: r'$' + portfolio!.profit.toStringAsFixed(2),
              figureState: FigureStateWidget(
                percent: portfolio!.profitPercentage,
                success: true,
              ),
            ),
            const Divider(endIndent: 12),
            figure(
              title: 'Assets',
              value: portfolio!.assets.toString(),
            ),
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
