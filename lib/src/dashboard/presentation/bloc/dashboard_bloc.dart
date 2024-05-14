import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required this.getOrders,
    required this.getPortfolio,
  }) : super(DashboardInitial()) {
    on<GetPortfolioEvent>(_getPortfolioHandler);
    on<GetOrdersEvent>(_getOrdersHandler);
  }

  final GetPortfolio getPortfolio;
  final GetOrders getOrders;

  Future<void> _getPortfolioHandler(
    GetPortfolioEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(PortfolioLoading());
    final failureOrPortfolio = await getPortfolio.call();
    failureOrPortfolio.fold(
      (newFailure) => emit(PortfolioError(failure: newFailure)),
      (newPortfolio) => emit(PortfolioLoaded(newPortfolio: newPortfolio)),
    );
  }

  Future<void> _getOrdersHandler(
    GetOrdersEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(OrdersLoading());
    final failureOrOrders = await getOrders.call();
    failureOrOrders.fold(
      (newFailure) => emit(OrdersError(failure: newFailure)),
      (newOrders) => emit(OrdersLoaded(newOrders: newOrders)),
    );
  }
}
