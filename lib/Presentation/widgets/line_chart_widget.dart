import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget({super.key});
  List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 1.70,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 18,
            left: 12,
            top: 24,
            bottom: 12,
          ),
          child: LineChart(LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              horizontalInterval: 1,
              verticalInterval: 1,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.blue,
                  strokeWidth: 1,
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Colors.amber,
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: bottomTitleWidgets,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: leftTitleWidgets,
                  reservedSize: 42,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d)),
            ),
            minX: 0,
            maxX: 7,
            minY: 0,
            maxY: 6,
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 3),
                  FlSpot(1.6, 2),
                  FlSpot(2.9, 5),
                  FlSpot(3.8, 3.1),
                  FlSpot(4, 4),
                  FlSpot(5.5, 3),
                  FlSpot(6, 4),
                  FlSpot(7, 4),
                ],
                isCurved: false,
                gradient: LinearGradient(
                  colors: gradientColors,
                ),
                barWidth: 5,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: gradientColors
                        .map((color) => color.withOpacity(0.3))
                        .toList(),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        String day = DateFormat('EEE')
            .format(DateTime.now().subtract(Duration(days: 7)));
        text = Text(day, style: style);

        break;
      case 1:
        String day = DateFormat('EEE')
            .format(DateTime.now().subtract(Duration(days: 6)));
        text = Text(day, style: style);

        break;
      case 2:
        String day = DateFormat('EEE')
            .format(DateTime.now().subtract(Duration(days: 5)));
        text = Text(day, style: style);

        break;
      case 3:
        String day = DateFormat('EEE')
            .format(DateTime.now().subtract(Duration(days: 4)));
        text = Text(day, style: style);
        break;
      case 4:
        String day = DateFormat('EEE')
            .format(DateTime.now().subtract(Duration(days: 3)));
        text = Text(day, style: style);
        break;
      case 5:
        String day = DateFormat('EEE')
            .format(DateTime.now().subtract(Duration(days: 2)));
        text = Text(day, style: style);
        break;
      case 6:
        String day = DateFormat('EEE')
            .format(DateTime.now().subtract(Duration(days: 1)));
        text = Text(day, style: style);
        break;
      case 7:
        String day = DateFormat('EEE')
            .format(DateTime.now().subtract(Duration(days: 0)));
        text = Text(day, style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
