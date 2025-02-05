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
            apiKey: "Api_key",
            authDomain: "auth_domain",
            projectId: "project_id",
            storageBucket: "",
            messagingSenderId: "",
            appId: "");
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
