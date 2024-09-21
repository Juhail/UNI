import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final VoidCallback showloginpage;

  const Register({super.key, required this.showloginpage});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailc = TextEditingController();

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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 150),
                const Text(
                  'Hello!',
                  style: TextStyle(color: Colors.purple, fontSize: 50),
                ),
                const SizedBox(height: 80),
                TextField(
                  controller: _emailc,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Email',
                      contentPadding: const EdgeInsets.all(20)),
                ),
                const SizedBox(height: 40),
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
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: SignUp,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
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
        ));
  }
}
