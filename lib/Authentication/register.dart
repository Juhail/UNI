import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni/Authentication/userdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  final VoidCallback showloginpage;

  const Register({super.key, required this.showloginpage});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailc = TextEditingController();
  final _nameou = TextEditingController();

  final _passwordc = TextEditingController();
  final confirmpassword = TextEditingController();

  Future SignUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    if (passswordconfirmed()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailc.text.trim(), password: _passwordc.text.trim());
        await addUserDetails(_emailc, _passwordc);
        final globalemail = _emailc.text.trim();
        Navigator.of(context).pop();
      } on FirebaseAuthException catch (e) {
        Navigator.of(context).pop();

        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(e.message.toString()),
              );
            });
      }
    }
  }

  Future addUserDetails(
      TextEditingController _emailc, TextEditingController _passwordc
      // String Name, String Age, String PhoneNumber, String Address
      ) async {
    // final userDoc =
    FirebaseFirestore.instance
        .collection('user details')
        .doc(_emailc.text.trim())
        .set({
      "name": _nameou.text.trim(),
      "email": _emailc.text.trim(),
      "password": _passwordc.text.trim()
    });
  }

  // Future<void> getdata() async {
  //   FirebaseFirestore.instance
  //       .collection('user details')
  //       .doc(_emailc.text.trim())
  //       .get(String);

  //   // Map<String, dynamic> data = userdet.data()!;
  //   // String name = 'Name';
  //   // String fieldvalue = data[name];
  //   // print('name: $fieldvalue');
  // }

  bool passswordconfirmed() {
    if (_passwordc.text.trim() == confirmpassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'Hello!',
                style: TextStyle(color: Colors.pinkAccent, fontSize: 50),
              ),
              const SizedBox(height: 60),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,

                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.grey[850]!.withOpacity(0.5),
                  //       spreadRadius: 3,
                  //       blurRadius: 3,
                  //       offset: const Offset(1, 2))
                  // ]
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(height: 150),

                    const SizedBox(height: 40),
                    TextField(
                      controller: _nameou,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Name',
                          contentPadding: const EdgeInsets.all(15)),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _emailc,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Email',
                          contentPadding: const EdgeInsets.all(15)),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      controller: _passwordc,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Password',
                          contentPadding: const EdgeInsets.all(15)),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      controller: confirmpassword,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Confirm Password',
                          contentPadding: const EdgeInsets.all(15)),
                    ),
                    const SizedBox(height: 60),
                    GestureDetector(
                      onTap: SignUp,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[850]!.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3))
                              ]),
                          padding: const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Text('Sign In',
                                style: TextStyle(
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white)),
                          )),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Iam already a member! '),
                        GestureDetector(
                          child: GestureDetector(
                            onTap: widget.showloginpage,
                            child: const Text(
                              'Log IN',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.purple),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
