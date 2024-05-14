import 'package:dartz/dartz.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class GetPortfolio {
  GetPortfolio({required this.repository});

  final DashboardRepository repository;

  Future<Either<Failure, PortfolioEntity>> call() {
    return repository.getPortfolio();
  }
}
