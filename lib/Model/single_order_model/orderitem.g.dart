// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orderitem _$OrderitemFromJson(Map<String, dynamic> json) => Orderitem(
      id: json['id'] as int?,
      orderId: json['order_id'] as int?,
      itemId: json['item_id'] as int?,
      name: json['name'] as String?,
      quantity: json['quantity'] as int?,
      price: json['price'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      orderItemAddons: json['order_item_addons'] as List<dynamic>?,
    );

Map<String, dynamic> _$OrderitemToJson(Orderitem instance) => <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'item_id': instance.itemId,
      'name': instance.name,
      'quantity': instance.quantity,
      'price': instance.price,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'order_item_addons': instance.orderItemAddons,
    };
