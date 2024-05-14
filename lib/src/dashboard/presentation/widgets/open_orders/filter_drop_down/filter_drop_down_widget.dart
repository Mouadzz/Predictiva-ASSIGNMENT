import 'dart:math';

import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class FilterDropDownWidget extends StatefulWidget {
  const FilterDropDownWidget({
    required this.onFilter,
    required this.filterParams,
    super.key,
  });

  final void Function(FilterParams) onFilter;
  final FilterParams filterParams;

  @override
  State<FilterDropDownWidget> createState() => _FilterDropDownWidgetState();
}

class _FilterDropDownWidgetState extends State<FilterDropDownWidget> {
  final textEditingController = TextEditingController();
  late FilterParams filterParams;

  @override
  void initState() {
    filterParams = widget.filterParams;
    textEditingController
      ..text = widget.filterParams.price != null
          ? widget.filterParams.price.toString()
          : ''
      ..addListener(() {
        filterParams.price = double.tryParse(textEditingController.text);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final double width = min(SizeConfig.screenWidth - 80, 467);
        return Container(
          margin: const EdgeInsets.only(top: 55),
          padding: EdgeInsets.all(width * 0.04),
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
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SymbolButton(
                    initialValue: widget.filterParams.symbol,
                    onSymbolChange: (symbol) {
                      filterParams.symbol = symbol;
                    },
                  ),
                  SizedBox(width: width * 0.03),
                  PriceInputField(textEditingController: textEditingController),
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Date Range',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  StartDateButton(
                    initialDate: widget.filterParams.startDate,
                    onDateChange: (startDate) {
                      filterParams.startDate = startDate;
                    },
                  ),
                  SizedBox(width: width * 0.03),
                  EndDateButton(
                    initialDate: widget.filterParams.endDate,
                    onDateChange: (endDate) {
                      filterParams.endDate = endDate;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              submitButton(onSubmit: () => widget.onFilter(filterParams)),
            ],
          ),
        );
      },
    );
  }

  Widget submitButton({
    required void Function() onSubmit,
  }) =>
      GestureDetector(
        onTap: onSubmit,
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
                fontSize: 10.5.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
