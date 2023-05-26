import 'package:desa_merdeka/konsultan/profile_konsultan.dart';
import 'package:flutter/material.dart';
import 'login_konsul.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfilePage(),
    );
  }
}
