import 'package:flutter/material.dart';
import 'package:newkidsapp/chat_app.dart';
import 'package:newkidsapp/login_registration/login.dart';

import 'package:newkidsapp/login_registration/reginstration.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ChatAppScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
      },
    );
  }
}
