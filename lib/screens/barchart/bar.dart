import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:uni/screens/barchart/bardata.dart';

class Barsem extends StatefulWidget {
  @override
  State<Barsem> createState() => _BarsemState();
}

class _BarsemState extends State<Barsem> {
  String? userEmail;
  late List<double> markst;
  late List<String> Marko = [];
  Future<String?> getMark() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        userEmail = currentUser.email;
      });
      print("useremail : $userEmail");
    } else {
      print('Document does not exist');
      return null;
    }
    try {
      DocumentSnapshot document = await FirebaseFirestore.instance
          .collection('user details')
          .doc(userEmail)
          .collection('mark')
          .doc(userEmail)
          .get();

      if (document.exists) {
        setState(() {
          double csTotal = document["CsTotal"].toDouble();
          double mathsTotal = document["MathTotal"].toDouble();
          double statiTotal = document["StatiTotal"].toDouble();
          double MdcTotal = document["MdcTotal"].toDouble();
          double AecTotal = document["AecTotal"].toDouble();

          List<double> markst = [
            csTotal,
            mathsTotal,
            statiTotal,
            MdcTotal,
            AecTotal,
            50
          ];
          // String mathsTotal = 'MathTotal';
          // String statiTotal = 'StatiTotal';
          // String MdcTotal = 'MdcTotal';
          // String AecTotal = 'AecTotal';

          print(markst);
        });
      } else {
        print('Document does not exist');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    getMark();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      //  swapAnimationDuration: Duration(seconds: 3),
      BarChartData(
          minY: 0,
          maxY: 100,
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
              rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value == meta.min || value == meta.max || value == 50) {
                    return Text(
                      value.toInt().toString(),
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    );
                  }
                  return Container();
                },
              )),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true, getTitlesWidget: getBottomTitles)),
              topTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: false,
              )),
              leftTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false))),
          gridData: FlGridData(show: true, drawVerticalLine: false),
          groupsSpace: 5,
          //
          //
          barGroups: barchartsections(bardata[0])

          // BarChartGroupData(x: 0, barRods: [
          //   BarChartRodData(
          //       toY: 40,
          //       color: Colors.deepPurple[300],
          //       width: 40,
          //       borderRadius: BorderRadius.circular(10)
          //       // backDrawRodData: BackgroundBarChartRodData(
          //       //     show: true, color: Colors.blueGrey[900], toY: 100),
          //       )
          // ]),
          // BarChartGroupData(x: 1, barsSpace: 5, barRods: [
          //   BarChartRodData(
          //       toY: 75,
          //       color: Colors.deepPurple[400],
          //       width: 40,
          //       borderRadius: BorderRadius.circular(8)),
          // ]),
          // BarChartGroupData(x: 2, barRods: [
          //   BarChartRodData(
          //       toY: 60,
          //       color: Colors.deepPurple[500],
          //       width: 40,
          //       borderRadius: BorderRadius.circular(8))
          // ]),
          // BarChartGroupData(x: 3, barRods: [
          //   BarChartRodData(
          //       toY: 50,
          //       color: Colors.deepPurple,
          //       width: 40,
          //       borderRadius: BorderRadius.circular(8))
          // ]),
          // BarChartGroupData(x: 4, barRods: [
          //   BarChartRodData(
          //       toY: 94,
          //       color: Colors.deepPurple[400],
          //       width: 40,
          //       borderRadius: BorderRadius.circular(8))
          // ]),
          // BarChartGroupData(x: 5, barRods: [
          //   BarChartRodData(
          //       toY: 30,
          //       color: Colors.deepPurple[300],
          //       width: 40,
          //       borderRadius: BorderRadius.circular(8))
          // ]),

          ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 13);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('CS', style: style);
      break;

    case 1:
      text = const Text('MA', style: style);
      break;
    case 2:
      text = const Text('ST', style: style);
      break;
    case 3:
      text = const Text('A1', style: style);
      break;
    case 4:
      text = const Text('MDC', style: style);
      break;
    case 5:
      text = const Text('A2', style: style);
      break;
    default:
      text = const Text(
        '',
        style: style,
      );
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}

//
int n = 0;

//
List<BarChartGroupData> barchartsections(List<double> values) {
  return List.generate(values.length, (i) {
    final colors = [
      Colors.purple[700],
      Colors.purple[300],
      Colors.purple,
      Colors.purple[400]
    ];
    return BarChartGroupData(x: i, barRods: [
      BarChartRodData(
        toY: values[i],
        width: 40,
        borderRadius: BorderRadius.circular(8),
        color: colors[i % colors.length],
      )
    ]);
  });
}
