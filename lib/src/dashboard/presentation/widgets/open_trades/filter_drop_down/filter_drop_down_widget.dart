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
  late FilterParams filterParams;

  @override
  void initState() {
    filterParams = widget.filterParams;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final useMobileLayout = SizeConfig.useMobileLayout;
        return Container(
          margin: EdgeInsets.only(
            top: useMobileLayout
                ? AppSizes.txlPadding * 2
                : AppSizes.nmxlPadding * 2,
          ),
          padding: EdgeInsets.all(
            useMobileLayout ? AppSizes.smPadding : AppSizes.dxlPadding,
          ),
          decoration: BoxDecoration(
            color: AppTheme.dark6,
            borderRadius: BorderRadius.circular(AppSizes.mdRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 52,
                offset: const Offset(0, 24),
              ),
            ],
          ),
          width: AppSizes.filterDropDownWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SymbolButton(
                    useMobileLayout: useMobileLayout,
                    initialValue: widget.filterParams.symbol,
                    onSymbolChange: (symbol) {
                      filterParams.symbol = symbol;
                    },
                  ),
                  SizedBox(
                    width: useMobileLayout
                        ? AppSizes.dxsPadding
                        : AppSizes.smPadding,
                  ),
                  PriceInputField(
                    initialValue: widget.filterParams.price,
                    useMobileLayout: useMobileLayout,
                    onPriceChange: (price) {
                      filterParams.price = price;
                    },
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.lgPadding),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Date Range',
                  style: TextStyle(
                    fontSize: AppSizes.smText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.xsPadding),
              Row(
                children: [
                  DateButton(
                    hint: 'Start Date',
                    useMobileLayout: useMobileLayout,
                    initialDate: widget.filterParams.startDate,
                    onDateChange: (startDate) {
                      filterParams.startDate = startDate;
                    },
                  ),
                  SizedBox(
                    width: useMobileLayout
                        ? AppSizes.dxsPadding
                        : AppSizes.smPadding,
                  ),
                  DateButton(
                    hint: 'End Date',
                    useMobileLayout: useMobileLayout,
                    initialDate: widget.filterParams.endDate,
                    onDateChange: (endDate) {
                      filterParams.endDate = endDate;
                    },
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.txlPadding),
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
            padding: const EdgeInsets.all(AppSizes.smPadding),
            decoration: BoxDecoration(
              color: AppTheme.greenAccent,
              borderRadius: BorderRadius.circular(AppSizes.mdRadius),
            ),
            child: const Text(
              'Filter table',
              style: TextStyle(
                fontSize: AppSizes.smText,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
}
