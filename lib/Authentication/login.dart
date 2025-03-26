import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni/Authentication/forgotpass.dart';
import 'package:uni/Authentication/userdetails.dart';

class Login extends StatefulWidget {
  final VoidCallback showRegister;

  const Login({super.key, required this.showRegister});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailc = TextEditingController();

  final _passwordc = TextEditingController();

  Future signIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    try {
      String email = _emailc.text.trim();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailc.text.trim(), password: _passwordc.text.trim());

      final globalemail = email;
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();

      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text('Something Went Wrong...'));
          });
    }
    // Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _emailc.dispose();
    _passwordc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 110,
              ),
              Text(
                'Welcome!',
                style: TextStyle(
                    color: Colors.deepPurple,
                    //Theme.of(context).colorScheme.background,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,

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
                  // mainAxisAlignment: MainAxisAlignment.sp,
                  children: [
                    //  const SizedBox(height: 200),

                    const SizedBox(height: 40),
                    TextField(
                      controller: _emailc,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Email',
                          contentPadding: const EdgeInsets.all(10)),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      obscureText: true,
                      controller: _passwordc,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Password',
                          contentPadding: const EdgeInsets.all(10)),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return Forgotpass();
                          })));
                        },
                        child: Text('Forgot Password',
                            style: TextStyle(color: Colors.white))),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: signIn,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[850]!.withOpacity(0.5),
                                    spreadRadius: 4,
                                    blurRadius: 4,
                                    offset: const Offset(0, 3))
                              ]),
                          padding: const EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child: Text('Login',
                                style: TextStyle(
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white)),
                          )),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Didn\'t have an account? '),
                        GestureDetector(
                          child: GestureDetector(
                            onTap: widget.showRegister,
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
