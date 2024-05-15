import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class TableRowsWidget extends StatelessWidget {
  const TableRowsWidget({
    required this.useMobileLayout,
    required this.orderList,
    super.key,
  });

  final bool useMobileLayout;
  final List<OrderEntity> orderList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (useMobileLayout) const Divider() else desktopTableHeader(),
        for (final order in orderList)
          OrderWidget(
            order: order,
            useMobileLayout: useMobileLayout,
          ),
        if (useMobileLayout) const Divider(),
      ],
    );
  }

  Widget desktopTableHeader() => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSizes.dxlPadding),
        child: Row(
          children: [
            const Expanded(child: SizedBox()),
            expandWrapper(child: textWidget('Symbol')),
            expandWrapper(child: textWidget('Price')),
            expandWrapper(child: textWidget('Type')),
            expandWrapper(child: textWidget('Action')),
            expandWrapper(child: textWidget('Quantity')),
            expandWrapper(child: textWidget('Date')),
          ],
        ),
      );

  Widget textWidget(String value) => Text(
        value,
        style: const TextStyle(
          fontSize: AppSizes.mdText,
          fontWeight: FontWeight.w600,
        ),
      );

  Widget expandWrapper({required Widget child}) => Expanded(
        flex: 5,
        child: Align(alignment: Alignment.centerLeft, child: child),
      );
}
