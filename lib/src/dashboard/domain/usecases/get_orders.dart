import 'package:dartz/dartz.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class GetOrders {
  GetOrders({required this.repository});

  final DashboardRepository repository;

  Future<Either<Failure, List<OrderEntity>>> call() {
    return repository.getOrders();
  }
}
