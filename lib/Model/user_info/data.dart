import 'package:json_annotation/json_annotation.dart';

import 'earning.dart';
import 'order.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  @JsonKey(name: 'auth_token')
  String? authToken;
  String? name;
  String? email;
  @JsonKey(name: 'wallet_balance')
  int? walletBalance;
  int? onGoingCount;
  int? completedCount;
  List<Order>? orders;
  List<Earning>? earnings;
  int? totalEarnings;
  String? deliveryCollection;

  Data({
    this.id,
    this.authToken,
    this.name,
    this.email,
    this.walletBalance,
    this.onGoingCount,
    this.completedCount,
    this.orders,
    this.earnings,
    this.totalEarnings,
    this.deliveryCollection,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
