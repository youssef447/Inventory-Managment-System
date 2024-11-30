import 'dart:ui';

class ChartDataEntity {
  final String xAxisLabel;
  final String xAxisLabelArabic;
  final int yAxisLabel;
  final Color? chartItemColor;

  ChartDataEntity({
    required this.xAxisLabel,
    required this.xAxisLabelArabic,
    required this.yAxisLabel,
    this.chartItemColor,
  });
}
