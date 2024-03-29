import 'package:flutter/material.dart';
import 'desa/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desa Merdeka',
      theme: ThemeData(
        fontFamily: 'Lato',
      ),
      home: LoginPage(),
    );
  }
}
