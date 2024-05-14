import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/filter_drop_down/drop_down_controller.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/filter_drop_down/filter_drop_down_widget.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/filter_drop_down/filter_params_model.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/open_trades_header_widget.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/open_trades_pagination_widget.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/trade_item_widget.dart';

class OpenTradesWidget extends StatefulWidget {
  const OpenTradesWidget({super.key});

  @override
  State<OpenTradesWidget> createState() => _OpenTradesWidgetState();
}

class _OpenTradesWidgetState extends State<OpenTradesWidget> {
  int tradesPerPage = 5;
  int currentPage = 1;
  late List<String> trades;
  late int totalPages;
  final dropDownController = DropDownController();
  FilterParams filterParams = FilterParams();

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
      child: Stack(
        children: [
          Column(
            children: [
              OpenTradesHeaderWidget(onFilterTap: dropDownController.toggle),
              currentPageWidget(
                tradeList: trades.sublist(startIndex - 1, endIndex),
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
          ValueListenableBuilder<bool>(
            valueListenable: dropDownController.isShowing,
            builder: (context, isShowing, child) {
              if (isShowing) {
                return Align(
                  alignment: Alignment.topRight,
                  child: FilterDropDownWidget(
                    filterParams: filterParams,
                    onFilter: (newFilterParams) {
                      print(newFilterParams.symbol);
                      print(newFilterParams.price);
                      print(newFilterParams.startDate);
                      print(newFilterParams.endDate);
                      dropDownController.hide();
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget currentPageWidget({required List<String> tradeList}) => Column(
        children: [
          for (final trade in tradeList)
            TradeItemWidget(
              symbol: trade,
            ),
          const Divider(),
        ],
      );
}
