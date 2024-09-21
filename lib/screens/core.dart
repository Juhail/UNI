import 'package:flutter/material.dart';
import 'package:uni/screens/home.dart';
import 'package:uni/screens/subs.dart';
import 'package:uni/screens/profile.dart';

class Core extends StatefulWidget {
  @override
  _CoreState createState() => _CoreState();
}

int selectedIndex = 1;

class _CoreState extends State<Core> {
  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [Subs(), Home(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black26, blurRadius: 10, offset: Offset(0, 10)),
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
              selectedFontSize: 10,
              backgroundColor: Colors.white,
              showSelectedLabels: true,
              elevation: 8,
              selectedItemColor: Colors.deepPurple,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey,
              currentIndex: selectedIndex,
              type: BottomNavigationBarType.fixed,
              onTap: changeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Sub',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ]),
        ),
      ),
    );
  }
}
