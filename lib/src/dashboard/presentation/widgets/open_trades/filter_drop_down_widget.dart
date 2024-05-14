import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class FilterDropDownWidget extends StatelessWidget {
  const FilterDropDownWidget({required this.dropDownWidth, super.key});

  final double? dropDownWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(3.5.w),
      decoration: BoxDecoration(
        color: AppTheme.dark6,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 52,
            offset: const Offset(0, 24),
          ),
        ],
      ),
      width: dropDownWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              dropDownButton(
                title: 'Symbol',
                assetPath: 'assets/images/nav-arrow-down.png',
                onTap: () {},
              ),
              SizedBox(width: 3.w),
              dropDownButton(
                title: 'Price',
                assetPath: 'assets/images/calendar.png',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Date Range',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              dropDownButton(
                title: 'Start date',
                assetPath: 'assets/images/calendar.png',
                onTap: () {},
              ),
              SizedBox(width: 3.w),
              dropDownButton(
                title: 'End date',
                assetPath: 'assets/images/calendar.png',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              //
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppTheme.greenAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Filter table',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget dropDownButton({
    required String title,
    required String assetPath,
    required void Function() onTap,
  }) =>
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.stroke),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppTheme.grey2,
                ),
              ),
              Image.asset(
                assetPath,
                width: 14.sp,
                height: 14.sp,
              ),
            ],
          ),
        ),
      );
}
