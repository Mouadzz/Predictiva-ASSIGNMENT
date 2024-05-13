import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class OpenTradesHeaderWidget extends StatelessWidget {
  const OpenTradesHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Open trades',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.stroke),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/filter-list.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
