import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class TableHeaderWidget extends StatelessWidget {
  const TableHeaderWidget({
    required this.onFilterTap,
    required this.isMobile,
    super.key,
  });

  final void Function() onFilterTap;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical:
            SizeConfig.isTablet ? AppSizes.xlPadding : AppSizes.dxlPadding,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Open trades',
                style: TextStyle(
                  fontSize: isMobile || SizeConfig.isTablet
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
          isMobile
              ? AppSizes.dxsPadding
              : SizeConfig.isTablet
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
            if (!isMobile)
              Padding(
                padding: const EdgeInsets.only(right: AppSizes.dxsPadding),
                child: Text(
                  'Filter',
                  style: TextStyle(
                    fontSize: SizeConfig.isTablet
                        ? AppSizes.mdText
                        : AppSizes.nmdText,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.grey1,
                  ),
                ),
              ),
            Image.asset(
              'assets/images/filter-list.png',
              width: SizeConfig.isTablet ? AppSizes.mdIcon : AppSizes.lgIcon,
              height: SizeConfig.isTablet ? AppSizes.mdIcon : AppSizes.lgIcon,
            ),
          ],
        ),
      ),
    );
  }
}
