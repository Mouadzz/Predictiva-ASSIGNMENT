import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.symbol,
    required super.type,
    required super.side,
    required super.quantity,
    required super.creationTime,
    required super.price,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      symbol: parseSymbol(json['symbol'] as String),
      type: json['type'] as String,
      side: json['side'] as String,
      quantity: json['quantity'] as double,
      creationTime: DateTime.fromMillisecondsSinceEpoch(
        (json['creation_time'] as int) * 1000,
      ),
      price: json['price'] as double,
    );
  }

  static TradingSymbol parseSymbol(String symbol) {
    switch (symbol) {
      case 'DOTUSDT':
        return TradingSymbol.DOTUSDT;
      case 'ETHUSDT':
        return TradingSymbol.ETHUSDT;
      case 'MINAUSDT':
        return TradingSymbol.MINAUSDT;
      case 'FETUSDT':
        return TradingSymbol.FETUSDT;
      case 'SOLUSDT':
        return TradingSymbol.SOLUSDT;
      case 'APTUSDT':
        return TradingSymbol.APTUSDT;
      case 'BTCUSDT':
        return TradingSymbol.BTCUSDT;
      case 'OKBUSDT':
        return TradingSymbol.OKBUSDT;
      case 'STXUSDT':
        return TradingSymbol.STXUSDT;
      case 'FILUSDT':
        return TradingSymbol.FILUSDT;
      case 'CHRUSDT':
        return TradingSymbol.CHRUSDT;
      case 'LINKUSDT':
        return TradingSymbol.LINKUSDT;
      case 'SHIBUSDT':
        return TradingSymbol.SHIBUSDT;
      case 'TRXUSDT':
        return TradingSymbol.TRXUSDT;
      case 'BCHUSDT':
        return TradingSymbol.BCHUSDT;
      case 'NEARUSDT':
        return TradingSymbol.NEARUSDT;
      case 'MATICUSDT':
        return TradingSymbol.MATICUSDT;
      case 'ATOMUSDT':
        return TradingSymbol.ATOMUSDT;
      case 'MNTUSDT':
        return TradingSymbol.MNTUSDT;
      default:
        throw ParsingException('Invalid TradingSymbol: $symbol');
    }
  }
}
