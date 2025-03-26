import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:uni/screens/barchart/bar.dart';

import 'package:uni/screens/barchart/sem1bar.dart';
import 'package:uni/screens/eventscs.dart';
import 'package:uni/screens/timetable.dart';
import 'package:uni/screens/tools.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

DateTime now = DateTime.now();

DateTime today = DateTime(now.year, now.month, now.weekday + 8);
String ttable = today.weekday.toString();

class _HomeState extends State<Home> {
  var ssk = 'sb$ttable';

// slist = sb5[index];

  List<String> todayclasses = timeTable[ttable]!;

  @override
  Widget build(BuildContext context) {
    print(ttable);
    print(today);

    return Scaffold(
        appBar: AppBar(
          // leading;
          //flexibleSpace: Icon(Icons.calculate),
          backgroundColor: Theme.of(context).colorScheme.background,
          centerTitle: true,
          title: Text(
            'Home',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                // fontFamily: 'Nunito',
                fontSize: 30,
                letterSpacing: 3),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text(
                  DateFormat.EEEE().format(today),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  DateFormat.MMM().format(today),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 160,
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: 7,
              itemBuilder: ((context, index) {
                //
                //
                //
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 150,
                      height: 100,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: textcolor[index],
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[850]!.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 3,
                                offset: const Offset(0, 3))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // SizedBox(
                          //   height: 3,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              todayclasses[index],
                              softWrap: true,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      times[index],
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                );
              }),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
              margin: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 410,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[850]!.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: const Offset(1, 2))
                  ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '2023-2024',
                          style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                                value: 'More',
                                child: Text('More'),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: ((context) {
                                      return Sem1();
                                    }),
                                  ));
                                })
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Barsem()),
                  ])),
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: 300,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[850]!.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(1, 2))
                ]),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Events',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      child: Icon(Icons.add_circle_outline_outlined),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: ((context) {
                            return Tools();
                          }),
                        ));
                      },
                    ),
                  ],
                ),
                corousal()
              ],
            ),
          ),
        ])));
  }
}
