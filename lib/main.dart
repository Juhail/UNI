import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uni/Authentication/authpage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:uni/Authentication/mainpage.dart';
import 'package:uni/Authentication/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAsEOqTlju2jlosTakAoQQemTJ-sgc7uxw",
            authDomain: "uni-app-6d7cf.firebaseapp.com",
            projectId: "uni-app-6d7cf",
            storageBucket: "uni-app-6d7cf.appspot.com",
            messagingSenderId: "581438240819",
            appId: "1:581438240819:web:7a1e06899c676efdb64b46"));
    print('webbb');
  } else {
    await Firebase.initializeApp();
    print('Mobile');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: mainpage());
  }
}
