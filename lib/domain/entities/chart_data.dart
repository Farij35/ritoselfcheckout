List<ChartData> getChartData() {
  return [
    ChartData(1, 35),
    ChartData(2, 23),
    ChartData(3, 34),
    ChartData(4, 25),
    ChartData(5, 40)
  ];
}

List<SalesData> getSalesData() {
  return [
    SalesData('Senin', 35),
    SalesData('Selasa', 28),
    SalesData('Rabu', 34),
    SalesData('Kamis', 32),
    SalesData('Jumat', 40)
  ];
}

class ChartData {
  final int x;
  final double y;

  ChartData(this.x, this.y);
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
