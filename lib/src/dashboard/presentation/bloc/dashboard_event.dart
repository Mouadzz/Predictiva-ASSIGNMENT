part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class GetPortfolioEvent extends DashboardEvent {}

class GetOrdersEvent extends DashboardEvent {}
