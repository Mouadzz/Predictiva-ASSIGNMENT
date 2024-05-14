import 'package:predictiva/src/dashboard/domain/entities/order_entity.dart';

class FilterParams {
  FilterParams({
    this.endDate,
    this.symbol,
    this.price,
    this.startDate,
  });

  TradingSymbol? symbol;
  double? price;
  DateTime? startDate;
  DateTime? endDate;
}
