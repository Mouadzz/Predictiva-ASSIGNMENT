import 'package:predictiva/src/dashboard/dashboard.dart';

class PortfolioDataModel {
  PortfolioDataModel({required this.status, required this.data});

  factory PortfolioDataModel.fromJson(Map<String, dynamic> json) {
    return PortfolioDataModel(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      data: PortfolioData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Status status;
  final PortfolioData data;
}

class PortfolioData {
  PortfolioData({required this.portfolio});

  factory PortfolioData.fromJson(Map<String, dynamic> json) {
    return PortfolioData(
      portfolio:
          PortfolioModel.fromJson(json['portfolio'] as Map<String, dynamic>),
    );
  }

  final PortfolioModel portfolio;
}
