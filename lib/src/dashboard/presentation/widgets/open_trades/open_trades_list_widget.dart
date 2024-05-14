import 'package:flutter/material.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/trade_item_widget.dart';

class OpenTradesListWidget extends StatelessWidget {
  const OpenTradesListWidget({
    required this.currentPageTrades,
    super.key,
  });

  final List<String> currentPageTrades;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            width: constraints.maxWidth,
            child: Column(
              children: [
                for (final trade in currentPageTrades)
                  TradeItemWidget(
                    symbol: trade,
                  ),
                const Divider(
                  thickness: 1,
                  height: 0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
