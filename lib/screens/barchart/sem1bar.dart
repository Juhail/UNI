import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:uni/screens/barchart/bar.dart';
import 'package:uni/screens/barchart/bardata.dart';
import 'package:uni/screens/barchart/mark.dart';

class Sem1 extends StatefulWidget {
  @override
  State<Sem1> createState() => _Sem1State();
}

class _Sem1State extends State<Sem1> {
  Widget build(BuildContext context) {
    // getMark();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PopupMenuButton(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              // BoxShadow(
                              //     color: Colors.grey[850]!.withOpacity(0.5),
                              //     spreadRadius: 3,5
                              //     blurRadius: 3,
                              //     offset: const Offset(1, 2))
                            ]),
                        child: Row(
                          children: [
                            Text(
                              'Sem',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.expand_more)
                          ],
                        ),
                      ),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'Sem 1',
                              child: Text('Sem 1 '),
                              onTap: () {
                                setState(() {
                                  m = 0;
                                });
                              },
                            ),
                            PopupMenuItem<String>(
                              value: 'Sem 2',
                              child: Text('Sem 2'),
                              onTap: () {
                                setState(() {
                                  m = 1;
                                });
                              },
                            ),
                            PopupMenuItem<String>(
                              value: 'Sem 3',
                              child: Text('Sem 3'),
                              onTap: () {
                                setState(() {
                                  m = 2;
                                });
                              },
                            ),
                            PopupMenuItem<String>(
                              value: 'Sem 4',
                              child: Text('Sem 4'),
                              onTap: () {
                                setState(() {
                                  m = 3;
                                });
                              },
                            ),
                            PopupMenuItem<String>(
                              value: 'Sem 5',
                              child: Text('Sem 5'),
                              onTap: () {
                                setState(() {
                                  m = 4;
                                });
                              },
                            ),
                            PopupMenuItem<String>(
                              value: 'Sem 6',
                              child: Text('Sem 6'),
                              onTap: () {
                                setState(() {
                                  m = 5;
                                });
                              },
                            ),
                          ]),
                  Text(
                    'Oct 22- Nov22',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              thickness: 0.5,
            ),
            SizedBox(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Barsem(),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total Mark ',
                          style: TextStyle(
                              fontWeight: FontWeight.w100, fontSize: 20),
                        ),
                        Text(
                          '480',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Percentage ',
                          style: TextStyle(
                              fontWeight: FontWeight.w100, fontSize: 20),
                        ),
                        Text(
                          '82.7%',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        )
                      ],
                    )
                  ]),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text('Subs',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: ListView.builder(
                  itemCount: piedata.length,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                              height: 150,
                              width: 150,
                              child: PieChart(PieChartData(
                                sections: piechartsections(piedata[m][index]),
                                sectionsSpace: 8,
                                centerSpaceRadius: double.infinity,
                              ))),
                        ),
                        Text(
                          subs[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () {
                  {
                    Navigator.push(context, MaterialPageRoute(
                      builder: ((context) {
                        return MarkInput();
                      }),
                    ));
                  }
                },
                child: Container(
                  // width: 80,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'add mark',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.add)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<PieChartSectionData> piechartsections(List<double> values) {
  return List.generate(values.length, (i) {
    final colors = [
      Colors.purple[700],
      Colors.purple[300],
      Colors.purple,
      Colors.purple[400]
    ];
    return PieChartSectionData(
      value: values[i],
      color: colors[i % colors.length],
      title: '${values[i].toInt()}%',
      radius: 50,
    );
  });
}

// List<PieChartSectionData> getpiechartsections() {
//   return [
//     PieChartSectionData(
//       value: 40,
//       color: Colors.purple,
//       radius: 50,
//       title: 'Exam',
//     ),
//     PieChartSectionData(
//         value: 18, color: Colors.purple[300], radius: 50, title: 'Int(R)'),
//     PieChartSectionData(
//         value: 20, color: Colors.purple[200], radius: 50, title: 'Int(M)'),
//     PieChartSectionData(
//         value: 22, color: Colors.transparent, radius: 50, title: '-')
//   ];
// }
