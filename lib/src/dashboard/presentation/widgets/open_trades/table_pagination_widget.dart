import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class TablePaginationWidget extends StatelessWidget {
  const TablePaginationWidget({
    required this.onForward,
    required this.onBack,
    required this.paginationText,
    required this.isMobile,
    super.key,
  });

  final void Function()? onForward;
  final void Function()? onBack;
  final bool isMobile;
  final String paginationText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppSizes.dxlPadding,
        bottom: isMobile ? AppSizes.dxlPadding : AppSizes.txlPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            paginationText,
            style: TextStyle(
              fontSize: isMobile ? AppSizes.smText : AppSizes.mdText,
              color: AppTheme.grey1,
            ),
          ),
          Row(
            children: [
              arrowButton(
                assetPath: 'assets/images/nav-arrow-left.png',
                onTap: onBack,
                disabled: onBack == null,
              ),
              const SizedBox(width: AppSizes.smPadding),
              arrowButton(
                assetPath: 'assets/images/nav-arrow-right.png',
                onTap: onForward,
                disabled: onForward == null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget arrowButton({
    required void Function()? onTap,
    required String assetPath,
    bool disabled = false,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: AppSizes.lgIcon,
          height: AppSizes.lgIcon,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.smRadius),
            border: Border.all(color: AppTheme.stroke),
          ),
          child: Center(
            child: Image.asset(
              assetPath,
              width: AppSizes.lgText,
              height: AppSizes.lgText,
              color: disabled ? AppTheme.grey2 : Colors.white,
            ),
          ),
        ),
      );
}
