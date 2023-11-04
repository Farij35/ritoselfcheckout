import 'package:flutter/material.dart';
import 'package:ritoselfcheckout/presentation/widgets/build_appbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../domain/entities/chart_data.dart';
import '../../widgets/drawer_widget.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: buildAppBar("RitoAdministrator", true),
        drawer: drawerWidget(context),
        body: Row(
          children: [
            Expanded(
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(
                  text: 'Sales Harian',
                  textStyle: const TextStyle(
                      fontFamily: "BalooChettan2"
                  ),
                ),
                legend: const Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
                series: <LineSeries<SalesData, String>>[
                  LineSeries(
                      dataSource: getSalesData(),
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales,
                      dataLabelSettings: const DataLabelSettings(isVisible: true)
                  ),
                ],
              ),
            ),
            Expanded(
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(
                  text: 'Produk Terjual',
                  textStyle: const TextStyle(
                      fontFamily: "BalooChettan2"
                  ),
                ),
                legend: const Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
                series: <ChartSeries<ChartData, int>>[
                  ColumnSeries<ChartData, int> (
                      dataSource: getChartData(),
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

