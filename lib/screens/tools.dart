import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tools extends StatefulWidget {
  @override
  _ToolsState createState() => _ToolsState();
}

List<String> tools = [
  'Calculator',
  'Calender',
  'TO-DO',
  'Library',
  'bloodbank',
  'feedback',
  'About',
];
List<IconData> IconsO = [
  Icons.calculate_outlined,
  Icons.calendar_month,
  Icons.check_outlined,
  Icons.book_outlined,
  Icons.bloodtype_outlined,
  Icons.feedback_outlined,
  CupertinoIcons.exclamationmark_circle,
];

class _ToolsState extends State<Tools> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 1.5, maxCrossAxisExtent: 300),
      itemBuilder: (BuildContext context, index) {
        return Container(
          margin: EdgeInsets.all(15),
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[850]!.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(0, 3))
              ]),
          child: Column(
            children: [
              Icon(
                IconsO[index],
                size: 40,
                color: Colors.deepPurple,
                weight: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                tools[index],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      },
      itemCount: tools.length,
    ));
  }
}
