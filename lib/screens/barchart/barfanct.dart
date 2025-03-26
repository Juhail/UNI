import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartListView extends StatefulWidget {
  @override
  State<PieChartListView> createState() => _PieChartListViewState();
}

class _PieChartListViewState extends State<PieChartListView> {
  final List<List<double>> data = [
    [30, 20, 50],
    [10, 40, 50],
    [60, 20, 20],
    [25, 25, 50],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          height: 150,
          width: 150,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PieChart(
              PieChartData(
                sections: _buildPieChartSections(data[index]),
                centerSpaceRadius: 40,
              ),
            ),
          ),
        );
      },
    );
  }

  List<PieChartSectionData> _buildPieChartSections(List<double> values) {
    return List.generate(values.length, (i) {
      final colors = [Colors.red, Colors.green, Colors.blue, Colors.orange];
      print(values.length);
      return PieChartSectionData(
        value: values[i],
        title: '${values[i].toInt()}%',
        color: colors[i % colors.length],
        radius: 50,
        titleStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      );
    });
  }
}
