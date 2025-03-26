import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni/Authentication/userdetails.dart';
import 'package:uni/screens/edit_profile.dart';
import 'package:uni/screens/datas.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  _ProfileState createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {
  // void exampleusage() async {
  //   String email = globalemail.toString();
  //   String? username = await getUserName(email);
  //   if (username != null) {
  //     print('Name :$username');
  //   } else {
  //     print('Document does no exist');
  //     return null;
  //   }
  // }
  String? userEmail;
  @override
  void initState() {
    super.initState();
    getUserName();
  }

  Future<String?> getUserName() async {
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
          .get();

      if (document.exists) {
        setState(() {
          username = document["name"];
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

  // Map<String, dynamic> data = userdet.data()!;
  // String name = 'Name';
  // String fieldvalue = data[name];
  // print('name: $fieldvalue');

  Widget build(BuildContext context) {
    // getUserName();
    final emailofuser = userEmail;
    print("email :$globalemail");
    // var realname = null ? 'name' :namem;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: 3),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 120,
                  child: Icon(
                    Icons.person,
                    size: 120,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '$username',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      letterSpacing: 3),
                ),
                Text(
                  '$emailofuser',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 3),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return EditProfile();
                    })));
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Add Details',
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                GestureDetector(
                  onTap: () {
                    // FirebaseAuth.instance.signOut();
                    showModalBottomSheet(
                        elevation: 8,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Text(
                                  'Are  You Sure?',
                                  style: TextStyle(
                                    // color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                )),
                                SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'No',
                                            style: TextStyle(
                                              // color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          )),
                                      GestureDetector(
                                          onTap: () {
                                            FirebaseAuth.instance.signOut();
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(
                                              //   color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[850]!.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: const Offset(0, 3)),
                        ]),
                    child: Center(
                        child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
