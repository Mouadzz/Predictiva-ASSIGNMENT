import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';
import 'package:predictiva/src/dashboard/presentation/widgets/open_trades/talbe_rows_widget.dart';

class OrdersTableWidget extends StatefulWidget {
  const OrdersTableWidget({required this.isMobileLayout, super.key});

  final bool isMobileLayout;

  @override
  State<OrdersTableWidget> createState() => _OrdersTableWidgetState();
}

class _OrdersTableWidgetState extends State<OrdersTableWidget> {
  int ordersPerPage = 5;
  int currentPage = 1;
  List<OrderEntity> orders = [];
  List<OrderEntity> ordersSave = [];
  final dropDownController = DropDownController();
  FilterParams filterParams = FilterParams();

  @override
  void initState() {
    context.read<DashboardBloc>().add(GetOrdersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final totalPages = (orders.length / ordersPerPage).ceil();
    final startIndex = ((currentPage - 1) * ordersPerPage) + 1;
    var endIndex = currentPage * ordersPerPage;
    endIndex = endIndex > orders.length ? orders.length : endIndex;

    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is OrdersError) {
          showSnackBar(context, state.failure);
        }
        if (state is OrdersLoaded) {
          setState(() {
            orders = state.newOrders;
            ordersSave = orders;
          });
        }
      },
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: widget.isMobileLayout
                ? AppSizes.xlPadding
                : AppSizes.txlPadding,
          ),
          decoration: BoxDecoration(
            color: AppTheme.dark4,
            borderRadius: BorderRadius.circular(AppSizes.lgRadius),
            border: Border.all(color: AppTheme.stroke),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  TableHeaderWidget(
                    isMobileLayout: widget.isMobileLayout,
                    onFilterTap: dropDownController.toggle,
                  ),
                  TableRowsWidget(
                    orderList: orders.sublist(startIndex - 1, endIndex),
                    isMobileLayout: widget.isMobileLayout,
                  ),
                  TablePaginationWidget(
                    isMobileLayout: widget.isMobileLayout,
                    paginationText:
                        '$startIndex - $endIndex of ${orders.length}',
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
                        onFilter: filterOrders,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void filterOrders(FilterParams newFilterParams) {
    dropDownController.hide();
    setState(() {
      filterParams = newFilterParams;
      orders = ordersSave.where((order) {
        final symbolMatch =
            filterParams.symbol == null || order.symbol == filterParams.symbol;
        final priceMatch =
            filterParams.price == null || order.price <= filterParams.price!;
        final startDateMatch = filterParams.startDate == null ||
            isSameDateOrAfter(order.creationTime, filterParams.startDate!);
        final endDateMatch = filterParams.endDate == null ||
            isSameDateOrBefore(order.creationTime, filterParams.endDate!);
        return symbolMatch && priceMatch && startDateMatch && endDateMatch;
      }).toList();
      currentPage = 1;
    });
  }
}
