import 'package:json_annotation/json_annotation.dart';

import 'chart_datum.dart';

part 'chart.g.dart';

@JsonSerializable()
class Chart {
  List<ChartDatum>? chartData;

  Chart({this.chartData});

  factory Chart.fromJson(Map<String, dynamic> json) => _$ChartFromJson(json);

  Map<String, dynamic> toJson() => _$ChartToJson(this);
}
