// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accepted_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptedOrderModel _$AcceptedOrderModelFromJson(Map<String, dynamic> json) =>
    AcceptedOrderModel(
      newOrders: json['new_orders'] as List<dynamic>?,
      acceptedOrders: (json['accepted_orders'] as List<dynamic>?)
          ?.map((e) => AcceptedOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      pickedupOrders: json['pickedup_orders'] as List<dynamic>?,
    );

Map<String, dynamic> _$AcceptedOrderModelToJson(AcceptedOrderModel instance) =>
    <String, dynamic>{
      'new_orders': instance.newOrders,
      'accepted_orders': instance.acceptedOrders,
      'pickedup_orders': instance.pickedupOrders,
    };
