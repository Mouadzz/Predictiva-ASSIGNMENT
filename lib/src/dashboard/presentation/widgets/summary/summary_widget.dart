import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/summary/figures_layout_widget.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/summary/subscription_expiry_widget.dart';

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
            'Failed to load portfolio :\n${state.failure.message}',
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
            borderRadius: BorderRadius.circular(AppSizes.lgRadius),
            border: Border.all(color: AppTheme.stroke),
          ),
          child: portfolio != null
              ? Column(
                  children: [
                    FiguresLayoutWidget(
                      portfolio: portfolio,
                      useMobileLayout: widget.useMobileLayout,
                    ),
                    SubscriptionExpiryWidget(
                      useMobileLayout: widget.useMobileLayout,
                    ),
                  ],
                )
              : const SizedBox(),
        );
      },
    );
  }
}
