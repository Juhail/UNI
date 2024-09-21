import 'package:flutter/material.dart';

class CS extends StatefulWidget {
  @override
  _CSState createState() => _CSState();
}

class _CSState extends State<CS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Computer Science'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Icon(
            Icons.emoji_emotions,
            size: 180,
            color: Colors.yellow,
          ))
        ],
      ),
    );
  }
}
