import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/dashboard':
      return _pageBuilder(
        BlocProvider(
          create: (_) => DashboardBloc(),
          child: const DashboardPage(),
        ),
        settings: settings,
      );
    default:
      return _pageBuilder(
        const PageNotFound(),
        settings: settings,
      );
  }
}

MaterialPageRoute<dynamic> _pageBuilder(
  Widget page, {
  required RouteSettings settings,
}) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => page,
  );
}
