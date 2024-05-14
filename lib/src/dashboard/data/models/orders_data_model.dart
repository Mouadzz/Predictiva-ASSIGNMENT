import 'package:predictiva/src/dashboard/dashboard.dart';

class OrdersDataModel {
  OrdersDataModel({required this.status, required this.data});

  factory OrdersDataModel.fromJson(Map<String, dynamic> json) {
    return OrdersDataModel(
      status: Status.fromJson(json['status'] as Map<String, dynamic>),
      data: OrdersData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Status status;
  final OrdersData data;
}

class OrdersData {
  OrdersData({required this.orders});

  factory OrdersData.fromJson(Map<String, dynamic> json) {
    final orderList = (json['orders'] as List)
        .map(
          (item) => OrderModel.fromJson(item as Map<String, dynamic>),
        )
        .toList();

    return OrdersData(
      orders: orderList,
    );
  }

  final List<OrderModel> orders;
}
