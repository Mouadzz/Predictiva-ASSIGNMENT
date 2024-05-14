import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({required this.order, super.key});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.symbol.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                order.price.toString(),
                style: const TextStyle(
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
              Text(
                formatDate(order.creationTime),
                style: const TextStyle(
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
