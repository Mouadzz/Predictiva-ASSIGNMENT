import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Oops! The page you are looking for was not found.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
