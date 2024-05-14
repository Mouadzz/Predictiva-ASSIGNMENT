class OrderEntity {
  OrderEntity({
    required this.symbol,
    required this.type,
    required this.side,
    required this.quantity,
    required this.creationTime,
    required this.price,
  });
  final TradingSymbol symbol;
  final String type;
  final String side;
  final double quantity;
  final DateTime creationTime;
  final double price;
}

enum TradingSymbol {
  DOTUSDT,
  ETHUSDT,
  MINAUSDT,
  FETUSDT,
  SOLUSDT,
  APTUSDT,
  BTCUSDT,
  OKBUSDT,
  STXUSDT,
  FILUSDT,
  CHRUSDT,
  LINKUSDT,
  SHIBUSDT,
  TRXUSDT,
  BCHUSDT,
  NEARUSDT,
  MATICUSDT,
  ATOMUSDT,
  MNTUSDT,
  NONE,
}
