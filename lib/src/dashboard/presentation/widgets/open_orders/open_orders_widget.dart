import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class OpenOrdersWidget extends StatefulWidget {
  const OpenOrdersWidget({super.key});

  @override
  State<OpenOrdersWidget> createState() => _OpenOrdersWidgetState();
}

class _OpenOrdersWidgetState extends State<OpenOrdersWidget> {
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
          showSnackBar(
            context,
            'Failed to load orders :\n\n${state.failure.message}',
          );
        }

        if (state is OrdersLoaded) {
          setState(() {
            orders = state.newOrders;
            ordersSave = orders;
          });
        }
      },
      builder: (context, state) {
        if (orders.isEmpty) return const SizedBox();

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppTheme.dark4,
            borderRadius: BorderRadius.circular(AppSizes.lgRadius),
            border: Border.all(color: AppTheme.stroke),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  OpenOrdersHeaderWidget(
                    onFilterTap: dropDownController.toggle,
                  ),
                  currentPageWidget(
                    orderList: orders.sublist(startIndex - 1, endIndex),
                  ),
                  OpenOrdersPaginationWidget(
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

  Widget currentPageWidget({required List<OrderEntity> orderList}) => Column(
        children: [
          for (final order in orderList) OrderItemWidget(order: order),
          const Divider(),
        ],
      );

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

  bool isSameDateOrAfter(DateTime a, DateTime b) {
    return (a.year == b.year && a.month == b.month && a.day == b.day) ||
        a.isAfter(b);
  }

  bool isSameDateOrBefore(DateTime a, DateTime b) {
    return (a.year == b.year && a.month == b.month && a.day == b.day) ||
        a.isBefore(b);
  }
}
