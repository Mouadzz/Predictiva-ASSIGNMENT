import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class TradeItemWidget extends StatelessWidget {
  const TradeItemWidget({required this.symbol, super.key});

  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 1,
          height: 0,
        ),
        const SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                symbol,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '1.5636',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.dark5,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: AppTheme.error),
                ),
                child: const Text(
                  'Sell',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppTheme.error,
                  ),
                ),
              ),
              const Text(
                '19 Dec, 2023',
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.grey2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
