part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class PortfolioLoading extends DashboardState {}

final class PortfolioLoaded extends DashboardState {
  PortfolioLoaded({required this.newPortfolio});

  final PortfolioEntity newPortfolio;
}

final class PortfolioError extends DashboardState {
  PortfolioError({required this.failure});

  final Failure failure;
}

final class OrdersLoading extends DashboardState {}

final class OrdersLoaded extends DashboardState {
  OrdersLoaded({required this.newOrders});

  final List<OrderEntity> newOrders;
}

final class OrdersError extends DashboardState {
  OrdersError({required this.failure});

  final Failure failure;
}
