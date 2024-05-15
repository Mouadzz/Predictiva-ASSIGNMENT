import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class TableRowsWidget extends StatelessWidget {
  const TableRowsWidget({
    required this.isMobile,
    required this.orderList,
    super.key,
  });

  final bool isMobile;
  final List<OrderEntity> orderList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isMobile) const Divider() else desktopTableHeader(),
        for (final order in orderList)
          OrderWidget(
            order: order,
            isMobile: isMobile,
          ),
        if (isMobile) const Divider(),
      ],
    );
  }

  Widget desktopTableHeader() => Padding(
        padding: EdgeInsets.symmetric(
          vertical:
              SizeConfig.isTablet ? AppSizes.xlPadding : AppSizes.dxlPadding,
        ),
        child: Row(
          children: [
            expandWrapper(
              flex: SizeConfig.isTablet ? 1 : 2,
              child: const SizedBox(),
            ),
            expandWrapper(child: textWidget('Symbol')),
            expandWrapper(child: textWidget('Price')),
            expandWrapper(child: textWidget('Type')),
            expandWrapper(child: textWidget('Action')),
            expandWrapper(child: textWidget('Quantity')),
            expandWrapper(
              child: textWidget('Date'),
              flex: 8,
            ),
          ],
        ),
      );

  Widget expandWrapper({required Widget child, int flex = 7}) => Expanded(
        flex: flex,
        child: Align(alignment: Alignment.centerLeft, child: child),
      );

  Widget textWidget(String value) => Text(
        value,
        style: TextStyle(
          fontSize: SizeConfig.isTablet ? AppSizes.smText : AppSizes.mdText,
          fontWeight: FontWeight.w600,
        ),
      );
}
