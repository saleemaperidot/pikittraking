// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'earning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Earning _$EarningFromJson(Map<String, dynamic> json) => Earning(
      id: json['id'] as int?,
      payableType: json['payable_type'] as String?,
      payableId: json['payable_id'] as int?,
      walletId: json['wallet_id'] as int?,
      type: json['type'] as String?,
      amount: json['amount'] as int?,
      confirmed: json['confirmed'] as bool?,
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      uuid: json['uuid'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$EarningToJson(Earning instance) => <String, dynamic>{
      'id': instance.id,
      'payable_type': instance.payableType,
      'payable_id': instance.payableId,
      'wallet_id': instance.walletId,
      'type': instance.type,
      'amount': instance.amount,
      'confirmed': instance.confirmed,
      'meta': instance.meta,
      'uuid': instance.uuid,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
