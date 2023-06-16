// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart' as charts;
import 'package:flutter/material.dart';

class CategoryProductChart extends StatelessWidget {
  final charts.BarChartData barChartData;
  const CategoryProductChart({
    Key? key,
    required this.barChartData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(barChartData);
  }
}
