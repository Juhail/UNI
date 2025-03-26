import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uni/screens/cs.dart';

class Subs extends StatefulWidget {
  @override
  _SubsState createState() => _SubsState();
}

class _SubsState extends State<Subs> {
  List<String> subs = [
    "Computer Science",
    "Maths",
    "Statistics",
    "AEC",
    "MDC",
    "AEC II"
  ];
  // List<Widget> Iconic = [
  //   Icon(Icons.computer),
  //   Icon(Icons.compass_calibration),
  //   Icon(Icons.stacked_bar_chart),
  //   Icon(Icons.abc),
  //   Icon(Icons.mic),
  //   Icon(Icons.abc_outlined)
  // ];

  List<Color> textcolor = [
    Colors.grey,
    Colors.yellow,
    Colors.blueAccent,
    Colors.teal,
    Colors.orange,
    Colors.redAccent
  ];
  List<IconData> IconsOf = [
    Icons.computer,
    Icons.compass_calibration,
    Icons.stacked_bar_chart,
    Icons.abc,
    Icons.mic,
    Icons.abc_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 0, 10),
                  child: Text(
                    'Subs ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // height: 700,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemBuilder: (BuildContext, int index) {
                      return Padding(
                          padding: const EdgeInsets.all(15),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: ((context) {
                                    return CS();
                                  }),
                                ));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 70,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: textcolor[index],
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[850]!
                                              .withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 3,
                                          offset: const Offset(0, 3))
                                    ]),
                                child: Row(
                                  children: [
                                    Icon(
                                      IconsOf[index],
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      subs[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          letterSpacing: 5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )));
                    },
                    itemCount: subs.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
