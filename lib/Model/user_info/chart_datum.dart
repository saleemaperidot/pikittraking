import 'package:json_annotation/json_annotation.dart';

part 'chart_datum.g.dart';

@JsonSerializable()
class ChartDatum {
  int? y;
  String? x;

  ChartDatum({this.y, this.x});

  factory ChartDatum.fromJson(Map<String, dynamic> json) {
    return _$ChartDatumFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChartDatumToJson(this);
}
