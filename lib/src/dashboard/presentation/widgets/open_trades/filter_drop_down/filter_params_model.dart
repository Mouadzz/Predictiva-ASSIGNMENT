class FilterParams {
  FilterParams({
    this.endDate,
    this.symbol,
    this.price,
    this.startDate,
  });

  String? symbol;
  String? price;
  DateTime? startDate;
  DateTime? endDate;
}
