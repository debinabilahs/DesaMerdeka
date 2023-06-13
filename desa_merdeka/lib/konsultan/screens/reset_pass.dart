import 'package:firebase_auth/firebase_auth.dart';
import 'package:desa_merdeka/Desa/reusable_widgets/reusable_widget.dart';
import 'package:desa_merdeka/konsultan/utils/colors_utils.dart';
import 'package:flutter/material.dart';

class ResetPassKonsul extends StatefulWidget {
  const ResetPassKonsul({Key? key}) : super(key: key);

  @override
  _ResetPassKonsulState createState() => _ResetPassKonsulState();
}

class _ResetPassKonsulState extends State<ResetPassKonsul> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        elevation: 0,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.grey),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Reset Password", () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _emailTextController.text)
                      .then((value) => Navigator.of(context).pop());
                })
              ],
            ),
          ))),
    );
  }
}
