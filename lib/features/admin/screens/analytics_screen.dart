import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/features/admin/model/sales.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/features/admin/widgets/category_products_charts.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart' as charts;

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminService adminService = AdminService();
  int? totalEarning;
  List<Sales>? sales;
  late int showingToolTip;
  void getEarnings() async {
    var earningData = await adminService.getEarnings(context);
    totalEarning = earningData['totalEarning'];
    sales = earningData['sales'];
    setState(() {});
  }

  // charts.BarChartGroupData generateGroupData(int x, int y) {
  //   return charts.BarChartGroupData(
  //     x: x,
  //     showingTooltipIndicators: showingToolTip == x ? [0] : [],
  //     barRods: [
  //       charts.BarChartRodData(toY: y.toDouble()),
  //     ],
  //   );
  // }

  @override
  void initState() {
    super.initState();
    showingToolTip = -1;
    getEarnings();
  }

  @override
  Widget build(BuildContext context) {
    return totalEarning == null || sales == null
        ? const Loader()
        : Column(
            children: [
              Text(
                '\$$totalEarning',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 250,
                child: CategoryProductChart(
                  barChartData: charts.BarChartData(
                    barGroups: sales!
                        .map((e) => charts.BarChartGroupData(
                              //at x show string e.label like
                              x: sales!.indexOf(e), 
                              showingTooltipIndicators:
                                  showingToolTip == 1 ? [0] : [],
                              barRods: [
                                charts.BarChartRodData(
                                  toY: e.earning.toDouble(),
                                ),
                              ],
                            ))
                        .toList(),
                    // borderData: charts.FlBorderData(
                    //   show: false,
                    //   border: const Border(
                    //     bottom: BorderSide(color: Colors.black, width: 1),
                    //   ),
                    // ),
                  ),
                ),
              )
            ],
          );
  }
}
