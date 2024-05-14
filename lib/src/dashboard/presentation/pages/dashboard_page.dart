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
        final useMobileLayout = SizeConfig.useMobileLayout;
        return Scaffold(
          appBar: TopNavigationWidget(useMobileLayout: useMobileLayout),
          body: SafeArea(
            child: Center(
              child: Container(
                alignment: Alignment.center,
                constraints: BoxConstraints(maxWidth: SizeConfig.maxWidth),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: useMobileLayout
                        ? AppSizes.xlPadding
                        : AppSizes.mxlPadding,
                  ),
                  child: Column(
                    children: [
                      DashboardHeaderWidget(useMobileLayout: useMobileLayout),
                      SummaryWidget(useMobileLayout: useMobileLayout),
                      const SizedBox(height: 24),
                      OpenOrdersWidget(),
                      SizedBox(height: 100),
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
