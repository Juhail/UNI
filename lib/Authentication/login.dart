import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uni/Authentication/forgotpass.dart';

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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailc.text.trim(), password: _passwordc.text.trim());
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 200),
                const Text(
                  'Welcome!',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 50),
                ),
                const SizedBox(height: 80),
                TextField(
                  controller: _emailc,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Email',
                      contentPadding: const EdgeInsets.all(10)),
                ),
                const SizedBox(height: 20),
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
                        style: TextStyle(color: Colors.deepPurple))),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: signIn,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 5,
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
                              color: Colors.deepPurple),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
