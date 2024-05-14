import 'package:dartz/dartz.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

abstract class DashboardRepository {
  Future<Either<Failure, PortfolioEntity>> getPortfolio();

  Future<Either<Failure, List<OrderEntity>>> getOrders();
}
