import 'package:json_annotation/json_annotation.dart';

import 'accepted_order.dart';

part 'accepted_order_model.g.dart';

@JsonSerializable()
class AcceptedOrderModel {
  @JsonKey(name: 'new_orders')
  List<dynamic>? newOrders;
  @JsonKey(name: 'accepted_orders')
  List<AcceptedOrder>? acceptedOrders;
  @JsonKey(name: 'pickedup_orders')
  List<dynamic>? pickedupOrders;

  AcceptedOrderModel({
    this.newOrders,
    this.acceptedOrders,
    this.pickedupOrders,
  });

  factory AcceptedOrderModel.fromJson(Map<String, dynamic> json) {
    return _$AcceptedOrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AcceptedOrderModelToJson(this);
}
