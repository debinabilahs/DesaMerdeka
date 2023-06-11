// import 'package:desa_merdeka/Desa/screens/home.dart';
// import 'package:flutter/material.dart';
// import 'registrasi.dart';

// class LoginPage extends StatefulWidget {
//   LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.grey,
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//           leading: Image.asset("images/Desa_Merdeka.png"),
//           title: Text('DESA MERDEKA'),
//           centerTitle: false,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: 100,
//                 height: 100,
//                 padding: EdgeInsets.all(5),
//                 child: Center(
//                   child: Text(
//                     "LOGIN",
//                     style: TextStyle(fontSize: 30),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(color: Colors.white),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                     labelText: 'Masukan Email Anda',
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(color: Colors.white),
//                 child: TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(0),
//                     ),
//                     labelText: 'Masukan Password Anda',
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 80,
//                 padding: const EdgeInsets.all(20),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       minimumSize: const Size.fromHeight(50),
//                       backgroundColor: Colors.red),
//                   child: Text('Login'),
//                   onPressed: () {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return DesaMerdeka();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Belum mempunyai akun?',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(
//                       builder: (context) => RegistrasiPage(),
//                     ),
//                   );
//                 },
//                 child: Text(
//                   'Registrasi!',
//                   style: TextStyle(color: Color.fromARGB(255, 33, 44, 243)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
