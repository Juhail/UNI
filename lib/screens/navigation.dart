import 'package:flutter/material.dart';
import 'package:uni/screens/home.dart';
import 'package:uni/screens/subs.dart';
import 'package:uni/screens/profile.dart';
import 'package:uni/screens/tools.dart';

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

  Widget _selectedway = Home();
  List<IconData> IconsofN = [
    Icons.list,
    //Icons.calculate,
    Icons.home_filled,
    Icons.person,
  ];

  final List<Widget> pages = [
    Subs(),
    // Tools(),
    Home(), Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return

        //theme: ThemeData(iconTheme: IconThemeData(color: Colors.black)),
        Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        clipBehavior: Clip.hardEdge,
        // padding: const EdgeInsets.all(10),

        //foregroundDecoration: ,
        // margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            // border: Border.fromBorderSide(),
            //shape: BoxShape.circle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[850]!.withOpacity(0.5),
                  blurRadius: 30,
                  offset: Offset(0, 20)),
            ]),

        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     // ListView.builder(
        //     //     scrollDirection: Axis.horizontal,
        //     //     itemCount: IconsofN.length,
        //     //     itemBuilder: ((context, index) {
        //     //       return
        //     GestureDetector(
        //       onTap: () {
        //         setState(() {
        //           _selectedway = Subs();
        //         });
        //       },
        //       child: Icon(
        //         Icons.list,
        //       ),
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         setState(() {
        //           _selectedway = Tools();
        //         });
        //       },
        //       child: Icon(
        //         Icons.calculate,
        //       ),
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         setState(() {
        //           _selectedway = Home();
        //         });
        //       },
        //       child: Icon(
        //         Icons.home_filled,
        //       ),
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         setState(() {
        //           _selectedway = Profile();
        //         });
        //       },
        //       child: Icon(
        //         Icons.person,
        //       ),
        //     )
        //  })),
        //],
        // ),

        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              selectedFontSize: 10,
              //  backgroundColor: Colors.white,
              showSelectedLabels: true,
              elevation: 0,
              selectedItemColor: Colors.deepPurple,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey,
              currentIndex: selectedIndex,
              type: BottomNavigationBarType.fixed,
              onTap: changeIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Sub',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.calculate),
                //   label: 'tools',
                // ),
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
