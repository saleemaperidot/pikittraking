import 'package:json_annotation/json_annotation.dart';

import 'chart.dart';
import 'data.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  bool? success;
  Data? data;
  Chart? chart;

  UserInfo({this.success, this.data, this.chart});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return _$UserInfoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}
