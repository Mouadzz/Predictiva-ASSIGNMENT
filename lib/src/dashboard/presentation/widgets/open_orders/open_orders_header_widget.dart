import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class OpenOrdersHeaderWidget extends StatelessWidget {
  const OpenOrdersHeaderWidget({required this.onFilterTap, super.key});

  final void Function() onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Open trades',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              filterButton(onTap: onFilterTap),
            ],
          ),
        ],
      ),
    );
  }

  Widget filterButton({required void Function() onTap}) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.mdRadius),
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
      );
}
