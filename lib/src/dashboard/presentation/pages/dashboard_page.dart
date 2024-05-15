import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isMobileLayout = SizeConfig.isMobileLayout;
        return Scaffold(
          appBar: TopNavigationWidget(isMobileLayout: isMobileLayout),
          body: SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                constraints: BoxConstraints(maxWidth: SizeConfig.maxWidth),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobileLayout
                        ? AppSizes.xlPadding
                        : AppSizes.mxlPadding,
                  ),
                  child: Column(
                    children: [
                      DashboardHeaderWidget(isMobileLayout: isMobileLayout),
                      SummaryWidget(isMobileLayout: isMobileLayout),
                      const SizedBox(height: AppSizes.dxlPadding),
                      OrdersTableWidget(isMobileLayout: isMobileLayout),
                      const SizedBox(height: AppSizes.mxlPadding),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
