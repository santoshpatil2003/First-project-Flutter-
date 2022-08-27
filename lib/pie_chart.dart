import 'package:flutter/material.dart';
import 'package:flutter_app_2/transations.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class PieChart1 extends StatefulWidget {
  final List<Transations> list;
  const PieChart1({this.list, Key key}) : super(key: key);

  @override
  State<PieChart1> createState() => _PieChart1State();
}

class _PieChart1State extends State<PieChart1> {
  // void insert() {
  //   for (var str in widget.list) {
  //     items[str.catt] = double.parse(str.id);
  //   }
  // }

  // Map<String, double> items = {};
  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    final items = productsdata.items;
    final insert = productsdata.insert();
    insert;
    final size = MediaQuery.of(context).size;
    return items.isEmpty || items["Others"] == 0
        ? const Center(
            child: Text(
            "No Data",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ))
        : PieChart(
            dataMap: items,
            centerText: "Budget",
            chartRadius: size.width / 1,
            legendOptions: const LegendOptions(
              showLegendsInRow: true,
              legendPosition: LegendPosition.bottom,
              legendTextStyle: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
              decimalPlaces: 2,
            ),
            chartLegendSpacing: 20,
          );
  }
}
