// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderdetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orderdetails _$OrderdetailsFromJson(Map<String, dynamic> json) => Orderdetails(
      id: json['id'] as int?,
      orderstatusId: json['orderstatus_id'] as int?,
      uniqueOrderId: json['unique_order_id'] as String?,
      address: json['address'] as String?,
      paymentMode: json['payment_mode'] as String?,
      payable: json['payable'] as int?,
    );

Map<String, dynamic> _$OrderdetailsToJson(Orderdetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderstatus_id': instance.orderstatusId,
      'unique_order_id': instance.uniqueOrderId,
      'address': instance.address,
      'payment_mode': instance.paymentMode,
      'payable': instance.payable,
    };
