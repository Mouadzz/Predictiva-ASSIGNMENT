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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const DashboardHeaderWidget(),
                  SummaryWidget(useMobileLayout: useMobileLayout),
                  const SizedBox(height: 24),
                  const OpenOrdersWidget(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
