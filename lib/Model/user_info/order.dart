import 'package:json_annotation/json_annotation.dart';
import 'package:pikittraking/Model/user_info/orderdetails/orderdetails.dart';

import 'order.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  int? id;
  @JsonKey(name: 'order_id')
  int? orderId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'customer_id')
  int? customerId;
  @JsonKey(name: 'is_complete')
  int? isComplete;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Orderdetails? order;

  Order({
    this.id,
    this.orderId,
    this.userId,
    this.customerId,
    this.isComplete,
    this.createdAt,
    this.updatedAt,
    this.order,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
