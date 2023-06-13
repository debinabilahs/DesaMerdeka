import 'package:desa_merdeka/Desa/pages/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:desa_merdeka/Desa/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: ElevatedButton(
      //     child: Text("Logout"),
      //     onPressed: () {
      //       FirebaseAuth.instance.signOut().then((value) {
      //         print("Signed Out");
      //         Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => SignInScreen()));
      //       });
      //     },
      //   ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            leading: Icon(Icons.person),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              });
            },
            leading: Icon(Icons.logout),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
