import 'package:flutter/widgets.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/open_trades_header_widget.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/open_trades_list_widget.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/open_trades_pagination_widget.dart';

class OpenTradesWidget extends StatefulWidget {
  const OpenTradesWidget({required this.dropDownController, super.key});

  final OverlayPortalController dropDownController;

  @override
  State<OpenTradesWidget> createState() => _OpenTradesWidgetState();
}

class _OpenTradesWidgetState extends State<OpenTradesWidget> {
  int tradesPerPage = 5;
  int currentPage = 1;
  late List<String> trades;
  late int totalPages;

  @override
  void initState() {
    trades = List.generate(30, (index) => 'trade-${index + 1}');
    totalPages = (trades.length / tradesPerPage).ceil();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final startIndex = ((currentPage - 1) * tradesPerPage) + 1;
    var endIndex = currentPage * tradesPerPage;
    endIndex = endIndex > trades.length ? trades.length : endIndex;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppTheme.dark4,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.stroke),
      ),
      child: Column(
        children: [
          OpenTradesHeaderWidget(dropDownController: widget.dropDownController),
          OpenTradesListWidget(
            currentPageTrades: trades.sublist(startIndex - 1, endIndex),
          ),
          OpenTradesPaginationWidget(
            paginationText: '$startIndex - $endIndex of ${trades.length}',
            onBack: (currentPage > 1)
                ? () => setState(() {
                      currentPage -= 1;
                    })
                : null,
            onForward: (currentPage < totalPages)
                ? () => setState(() {
                      currentPage += 1;
                    })
                : null,
          ),
        ],
      ),
    );
  }
}
