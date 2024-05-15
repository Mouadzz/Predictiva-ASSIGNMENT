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
        final isMobile = SizeConfig.isMobile;
        return Scaffold(
          appBar: TopNavigationWidget(isMobile: isMobile),
          body: SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        isMobile ? AppSizes.xlPadding : AppSizes.mxlPadding,
                  ),
                  child: const Column(
                    children: [
                      DashboardHeaderWidget(),
                      SummaryWidget(),
                      SizedBox(height: AppSizes.dxlPadding),
                      OrdersTableWidget(),
                      SizedBox(height: AppSizes.mxlPadding),
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
