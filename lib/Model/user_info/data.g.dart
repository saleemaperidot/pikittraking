// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      authToken: json['auth_token'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      walletBalance: json['wallet_balance'] as int?,
      onGoingCount: json['onGoingCount'] as int?,
      completedCount: json['completedCount'] as int?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      earnings: (json['earnings'] as List<dynamic>?)
          ?.map((e) => Earning.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalEarnings: json['totalEarnings'] as int?,
      deliveryCollection: json['deliveryCollection'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'auth_token': instance.authToken,
      'name': instance.name,
      'email': instance.email,
      'wallet_balance': instance.walletBalance,
      'onGoingCount': instance.onGoingCount,
      'completedCount': instance.completedCount,
      'orders': instance.orders,
      'earnings': instance.earnings,
      'totalEarnings': instance.totalEarnings,
      'deliveryCollection': instance.deliveryCollection,
    };
