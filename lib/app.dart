import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class PredictivaApp extends StatelessWidget {
  const PredictivaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: () {
        return MaterialApp(
          title: 'Predictiva',
          theme: AppTheme.theme,
          initialRoute: '/dashboard',
          onGenerateRoute: generateRoute,
        );
      },
    );
  }
}
