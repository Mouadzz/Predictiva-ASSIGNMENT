class PortfolioEntity {
  PortfolioEntity({
    required this.balance,
    required this.profit,
    required this.profitPercentage,
    required this.assets,
  });

  final double balance;
  final double profit;
  final int profitPercentage;
  final int assets;
}
