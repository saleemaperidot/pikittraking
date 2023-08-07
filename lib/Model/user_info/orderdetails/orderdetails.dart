import 'package:json_annotation/json_annotation.dart';

part 'orderdetails.g.dart';

@JsonSerializable()
class Orderdetails {
  int? id;
  @JsonKey(name: 'orderstatus_id')
  int? orderstatusId;
  @JsonKey(name: 'unique_order_id')
  String? uniqueOrderId;
  String? address;
  @JsonKey(name: 'payment_mode')
  String? paymentMode;
  int? payable;

  Orderdetails({
    this.id,
    this.orderstatusId,
    this.uniqueOrderId,
    this.address,
    this.paymentMode,
    this.payable,
  });

  factory Orderdetails.fromJson(Map<String, dynamic> json) {
    return _$OrderdetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderdetailsToJson(this);
}
