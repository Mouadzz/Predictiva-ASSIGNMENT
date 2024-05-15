import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class TableHeaderWidget extends StatelessWidget {
  const TableHeaderWidget({
    required this.onFilterTap,
    required this.useMobileLayout,
    super.key,
  });

  final void Function() onFilterTap;
  final bool useMobileLayout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.dxlPadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Open trades',
                style: TextStyle(
                  fontSize:
                      useMobileLayout ? AppSizes.nmdText : AppSizes.lgText,
                  fontWeight: FontWeight.w600,
                ),
              ),
              filterButton(onTap: onFilterTap),
            ],
          ),
        ],
      ),
    );
  }

  Widget filterButton({required void Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
          useMobileLayout ? AppSizes.dxsPadding : AppSizes.smPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.mdRadius),
          border: Border.all(color: AppTheme.stroke),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!useMobileLayout)
              const Padding(
                padding: EdgeInsets.only(right: AppSizes.dxsPadding),
                child: Text(
                  'Filter',
                  style: TextStyle(
                    fontSize: AppSizes.nmdText,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.grey1,
                  ),
                ),
              ),
            Image.asset(
              'assets/images/filter-list.png',
              width: AppSizes.lgIcon,
              height: AppSizes.lgIcon,
            ),
          ],
        ),
      ),
    );
  }
}
