// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleOrderModel _$SingleOrderModelFromJson(Map<String, dynamic> json) =>
    SingleOrderModel(
      id: json['id'] as int?,
      uniqueOrderId: json['unique_order_id'] as String?,
      orderstatusId: json['orderstatus_id'] as int?,
      userId: json['user_id'] as int?,
      couponName: json['coupon_name'],
      location: json['location'] as String?,
      address: json['address'] as String?,
      tax: json['tax'],
      restaurantCharge: json['restaurant_charge'],
      deliveryCharge: json['delivery_charge'] as String?,
      total: json['total'] as int?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      paymentMode: json['payment_mode'] as String?,
      orderComment: json['order_comment'],
      restaurantId: json['restaurant_id'] as int?,
      transactionId: json['transaction_id'],
      deliveryType: json['delivery_type'] as int?,
      payable: json['payable'] as int?,
      walletAmount: json['wallet_amount'],
      tipAmount: json['tip_amount'],
      taxAmount: json['tax_amount'] as int?,
      couponAmount: json['coupon_amount'],
      subTotal: json['sub_total'] as int?,
      commission: json['commission'] as String?,
      restaurant: json['restaurant'] == null
          ? null
          : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
      orderitems: (json['orderitems'] as List<dynamic>?)
          ?.map((e) => Orderitem.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleOrderModelToJson(SingleOrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'unique_order_id': instance.uniqueOrderId,
      'orderstatus_id': instance.orderstatusId,
      'user_id': instance.userId,
      'coupon_name': instance.couponName,
      'location': instance.location,
      'address': instance.address,
      'tax': instance.tax,
      'restaurant_charge': instance.restaurantCharge,
      'delivery_charge': instance.deliveryCharge,
      'total': instance.total,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'payment_mode': instance.paymentMode,
      'order_comment': instance.orderComment,
      'restaurant_id': instance.restaurantId,
      'transaction_id': instance.transactionId,
      'delivery_type': instance.deliveryType,
      'payable': instance.payable,
      'wallet_amount': instance.walletAmount,
      'tip_amount': instance.tipAmount,
      'tax_amount': instance.taxAmount,
      'coupon_amount': instance.couponAmount,
      'sub_total': instance.subTotal,
      'commission': instance.commission,
      'restaurant': instance.restaurant,
      'orderitems': instance.orderitems,
      'user': instance.user,
    };
