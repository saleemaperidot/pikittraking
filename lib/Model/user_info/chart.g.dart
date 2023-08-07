// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chart _$ChartFromJson(Map<String, dynamic> json) => Chart(
      chartData: (json['chartData'] as List<dynamic>?)
          ?.map((e) => ChartDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChartToJson(Chart instance) => <String, dynamic>{
      'chartData': instance.chartData,
    };
