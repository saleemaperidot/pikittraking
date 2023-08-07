// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as int?,
      orderId: json['order_id'] as int?,
      userId: json['user_id'] as int?,
      customerId: json['customer_id'] as int?,
      isComplete: json['is_complete'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      order: json['order'] == null
          ? null
          : Orderdetails.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'user_id': instance.userId,
      'customer_id': instance.customerId,
      'is_complete': instance.isComplete,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'order': instance.order,
    };
