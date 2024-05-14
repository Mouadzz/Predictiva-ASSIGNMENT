import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class PredictivaApp extends StatefulWidget {
  const PredictivaApp({super.key});

  @override
  State<PredictivaApp> createState() => _PredictivaAppState();
}

class _PredictivaAppState extends State<PredictivaApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: () {
        return Container(
          constraints: BoxConstraints(maxWidth: SizeConfig.maxWidth),
          child: MaterialApp(
            title: 'Predictiva',
            theme: AppTheme.theme,
            initialRoute: '/dashboard',
            onGenerateRoute: generateRoute,
          ),
        );
      },
    );
  }
}
