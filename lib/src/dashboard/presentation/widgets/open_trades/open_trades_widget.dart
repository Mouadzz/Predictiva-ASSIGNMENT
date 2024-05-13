import 'package:flutter/widgets.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/open_trades_header_widget.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/open_trades_list_widget.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/open_trades_pagination_widget.dart';

class OpenTradesWidget extends StatelessWidget {
  const OpenTradesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppTheme.dark4,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.stroke),
      ),
      child: Column(
        children: [
          OpenTradesHeaderWidget(),
          OpenTradesListWidget(),
          OpenTradesPaginationWidget(),
        ],
      ),
    );
  }
}
