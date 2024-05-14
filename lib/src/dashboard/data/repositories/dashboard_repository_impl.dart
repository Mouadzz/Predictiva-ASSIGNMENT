import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl({required this.remoteDataSource});

  final DashboardRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, PortfolioEntity>> getPortfolio() async {
    try {
      final remotePortfolio = await remoteDataSource.getPortfolio();
      return Right(remotePortfolio);
    } on ServerException {
      return Left(ServerFailure(message: ErrorMessages.server));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Left(ConnectionFailure(message: ErrorMessages.connectionLost));
      }
      return Left(UnknownFailure(message: ErrorMessages.unknown));
    } catch (e) {
      return Left(UnknownFailure(message: ErrorMessages.unknown));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders() async {
    try {
      final remoteOrders = await remoteDataSource.getOrders();
      return Right(remoteOrders);
    } on ServerException {
      return Left(ServerFailure(message: ErrorMessages.server));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        return Left(ConnectionFailure(message: ErrorMessages.connectionLost));
      }
      return Left(UnknownFailure(message: ErrorMessages.unknown));
    } catch (e) {
      return Left(UnknownFailure(message: ErrorMessages.unknown));
    }
  }
}
