import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class TableHeaderWidget extends StatelessWidget {
  const TableHeaderWidget({
    required this.onFilterTap,
    required this.isMobileLayout,
    super.key,
  });

  final void Function() onFilterTap;
  final bool isMobileLayout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.isTabletLayout
            ? AppSizes.xlPadding
            : AppSizes.dxlPadding,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Open trades',
                style: TextStyle(
                  fontSize: isMobileLayout || SizeConfig.isTabletLayout
                      ? AppSizes.nmdText
                      : AppSizes.lgText,
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
          isMobileLayout
              ? AppSizes.dxsPadding
              : SizeConfig.isTabletLayout
                  ? AppSizes.xsPadding
                  : AppSizes.smPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.mdRadius),
          border: Border.all(color: AppTheme.stroke),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isMobileLayout)
              Padding(
                padding: const EdgeInsets.only(right: AppSizes.dxsPadding),
                child: Text(
                  'Filter',
                  style: TextStyle(
                    fontSize: SizeConfig.isTabletLayout
                        ? AppSizes.mdText
                        : AppSizes.nmdText,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.grey1,
                  ),
                ),
              ),
            Image.asset(
              'assets/images/filter-list.png',
              width:
                  SizeConfig.isTabletLayout ? AppSizes.mdIcon : AppSizes.lgIcon,
              height:
                  SizeConfig.isTabletLayout ? AppSizes.mdIcon : AppSizes.lgIcon,
            ),
          ],
        ),
      ),
    );
  }
}
