import 'package:json_annotation/json_annotation.dart';

import 'meta.dart';

part 'earning.g.dart';

@JsonSerializable()
class Earning {
  int? id;
  @JsonKey(name: 'payable_type')
  String? payableType;
  @JsonKey(name: 'payable_id')
  int? payableId;
  @JsonKey(name: 'wallet_id')
  int? walletId;
  String? type;
  int? amount;
  bool? confirmed;
  Meta? meta;
  String? uuid;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Earning({
    this.id,
    this.payableType,
    this.payableId,
    this.walletId,
    this.type,
    this.amount,
    this.confirmed,
    this.meta,
    this.uuid,
    this.createdAt,
    this.updatedAt,
  });

  factory Earning.fromJson(Map<String, dynamic> json) {
    return _$EarningFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EarningToJson(this);
}
