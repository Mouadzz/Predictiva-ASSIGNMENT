import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    required this.order,
    required this.isMobile,
    super.key,
  });

  final OrderEntity order;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return isMobile ? mobileLayout() : desktopLayout();
  }

  Widget desktopLayout() => Container(
        padding: EdgeInsets.symmetric(
          vertical:
              SizeConfig.isTablet ? AppSizes.xlPadding : AppSizes.dxlPadding,
        ),
        margin: const EdgeInsets.only(bottom: AppSizes.dxsPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.mdRadius),
          border: Border.all(color: AppTheme.stroke),
        ),
        child: Align(
          child: Row(
            children: [
              expandWrapper(
                flex: SizeConfig.isTablet ? 1 : 2,
                child: const SizedBox(),
              ),
              expandWrapper(child: symbolWidget()),
              expandWrapper(child: textWidget(order.price.toString())),
              expandWrapper(child: textWidget(order.type)),
              expandWrapper(child: sellButtonWidget()),
              expandWrapper(child: textWidget(order.quantity.toString())),
              expandWrapper(
                child: dateWidget(),
                flex: 8,
              ),
            ],
          ),
        ),
      );

  Widget expandWrapper({required Widget child, int flex = 7}) => Expanded(
        flex: flex,
        child: Align(alignment: Alignment.centerLeft, child: child),
      );

  Widget mobileLayout() => Column(
        children: [
          const Divider(),
          const SizedBox(height: AppSizes.lgPadding),
          Padding(
            padding: const EdgeInsets.only(right: AppSizes.lgPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                symbolWidget(),
                textWidget(order.price.toString()),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.dxsPadding),
          Padding(
            padding: const EdgeInsets.only(right: AppSizes.lgPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sellButtonWidget(),
                dateWidget(),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.lgPadding),
        ],
      );

  Widget textWidget(String value) => Text(
        value,
        style: TextStyle(
          fontSize: SizeConfig.isTablet ? AppSizes.smText : AppSizes.mdText,
        ),
      );

  Widget sellButtonWidget() => Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? AppSizes.xsPadding : AppSizes.smPadding,
          vertical: isMobile ? AppSizes.dxsPadding : AppSizes.xsPadding,
        ),
        decoration: BoxDecoration(
          color: AppTheme.dark5,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppTheme.error),
        ),
        child: const Text(
          'Sell',
          style: TextStyle(
            fontSize: AppSizes.smText,
            color: AppTheme.error,
          ),
        ),
      );

  Widget dateWidget() => Text(
        formatDate(order.creationTime),
        style: TextStyle(
          fontSize: SizeConfig.isTablet ? AppSizes.smText : AppSizes.mdText,
          color: AppTheme.grey2,
        ),
      );

  Widget symbolWidget() => Text(
        order.symbol.name,
        style: TextStyle(
          fontSize: SizeConfig.isTablet ? AppSizes.smText : AppSizes.mdText,
          fontWeight: FontWeight.w600,
        ),
      );
}
