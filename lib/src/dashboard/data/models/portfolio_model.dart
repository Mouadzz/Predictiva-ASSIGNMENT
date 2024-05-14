import 'package:predictiva/src/dashboard/dashboard.dart';

class PortfolioModel extends PortfolioEntity {
  PortfolioModel({
    required super.balance,
    required super.profit,
    required super.profitPercentage,
    required super.assets,
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      balance: json['balance'] as double,
      profit: json['profit'] as double,
      profitPercentage: json['profit_percentage'] as int,
      assets: json['assets'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'profit': profit,
      'profitPercentage': profitPercentage,
      'assets': assets,
    };
  }
}
