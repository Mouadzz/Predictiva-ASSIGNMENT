import 'package:dio/dio.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

abstract class DashboardRemoteDataSource {
  Future<PortfolioModel> getPortfolio();
  Future<List<OrderModel>> getOrders();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  DashboardRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<PortfolioModel> getPortfolio() async {
    final response = await dio.get<dynamic>(
      'https://api-cryptiva.azure-api.net/staging/api/v1/accounts/portfolio',
    );

    if (response.statusCode == 200) {
      final portfolioDataModel =
          PortfolioDataModel.fromJson(response.data as Map<String, dynamic>);
      if (portfolioDataModel.status.msg == 'success') {
        return portfolioDataModel.data.portfolio;
      }
    }
    throw ServerException();
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    final response = await dio.get<dynamic>(
      'https://api-cryptiva.azure-api.net/staging/api/v1/orders/open',
    );

    if (response.statusCode == 200) {
      final ordersDataModel =
          OrdersDataModel.fromJson(response.data as Map<String, dynamic>);
      if (ordersDataModel.status.msg == 'success') {
        return ordersDataModel.data.orders;
      }
    }
    throw ServerException();
  }
}
