import 'package:flutter/material.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi Robin,',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Here is an overview of your account activities.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}