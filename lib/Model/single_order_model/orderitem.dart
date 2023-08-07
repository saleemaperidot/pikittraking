import 'package:json_annotation/json_annotation.dart';

part 'orderitem.g.dart';

@JsonSerializable()
class Orderitem {
  int? id;
  @JsonKey(name: 'order_id')
  int? orderId;
  @JsonKey(name: 'item_id')
  int? itemId;
  String? name;
  int? quantity;
  String? price;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'order_item_addons')
  List<dynamic>? orderItemAddons;

  Orderitem({
    this.id,
    this.orderId,
    this.itemId,
    this.name,
    this.quantity,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.orderItemAddons,
  });

  factory Orderitem.fromJson(Map<String, dynamic> json) {
    return _$OrderitemFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderitemToJson(this);
}
