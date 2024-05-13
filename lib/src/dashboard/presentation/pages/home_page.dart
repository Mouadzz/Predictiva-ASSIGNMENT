import 'package:flutter/material.dart';
import 'package:predictiva/core/common/widgets/top_navigation_widget.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/dashboard_header_widget.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/open_trades_widget.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/summary/summary_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final useMobileLayout = SizeConfig.useMobileLayout;
        return Scaffold(
          appBar: TopNavigationWidget(useMobileLayout: useMobileLayout),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                const DashboardHeaderWidget(),
                SummaryWidget(useMobileLayout: useMobileLayout),
                const SizedBox(height: 24),
                const OpenTradesWidget(),
                const SizedBox(height: 100),
              ],
            ),
          ),
        );
      },
    );
  }
}
