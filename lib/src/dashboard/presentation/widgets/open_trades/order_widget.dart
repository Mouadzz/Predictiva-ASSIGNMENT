import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    required this.order,
    required this.useMobileLayout,
    super.key,
  });

  final OrderEntity order;
  final bool useMobileLayout;

  @override
  Widget build(BuildContext context) {
    return useMobileLayout ? mobileLayout() : desktopLayout();
  }

  Widget desktopLayout() => Container(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.dxlPadding),
        margin: const EdgeInsets.only(bottom: AppSizes.dxsPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.mdRadius),
          border: Border.all(color: AppTheme.stroke),
        ),
        child: Align(
          child: Row(
            children: [
              const Expanded(child: SizedBox()),
              expandWrapper(child: symbolWidget()),
              expandWrapper(child: textWidget(order.price.toString())),
              expandWrapper(child: textWidget(order.type)),
              expandWrapper(child: sellButtonWidget()),
              expandWrapper(child: textWidget(order.quantity.toString())),
              expandWrapper(child: dateWidget()),
            ],
          ),
        ),
      );

  Widget expandWrapper({required Widget child}) => Expanded(
        flex: 5,
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
        style: const TextStyle(fontSize: AppSizes.mdText),
      );

  Widget sellButtonWidget() => Container(
        padding: EdgeInsets.symmetric(
          horizontal: useMobileLayout ? AppSizes.xsPadding : AppSizes.smPadding,
          vertical: useMobileLayout ? AppSizes.dxsPadding : AppSizes.xsPadding,
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
        style: const TextStyle(
          fontSize: AppSizes.mdText,
          color: AppTheme.grey2,
        ),
      );

  Widget symbolWidget() => Text(
        order.symbol.name,
        style: const TextStyle(
          fontSize: AppSizes.mdText,
          fontWeight: FontWeight.w600,
        ),
      );
}
