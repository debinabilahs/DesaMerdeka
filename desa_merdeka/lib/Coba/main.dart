// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:desa_merdeka/firebase_options.dart';
// import 'package:provider/provider.dart';

// import 'login.dart';
// import 'package:desa_merdeka/Desa/pages/auth_page.dart';
// import 'package:desa_merdeka/Desa/providers/auth.dart';

// void main() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       // create: (ctx) => Products(),
//       builder: (context, child) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Desa Merdeka',
//         home: LoginPage(),
//         // routes: {
//         //   AddProductPage.route: (ctx) => AddProductPage(),
//         //   EditProductPage.route: (ctx) => EditProductPage(),
//         // },
//       ),
//     );
//   }
// }
