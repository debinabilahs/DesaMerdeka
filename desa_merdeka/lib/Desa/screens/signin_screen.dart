import 'package:firebase_auth/firebase_auth.dart';
import 'package:desa_merdeka/Desa/reusable_widgets/reusable_widget.dart';
import 'package:desa_merdeka/Desa/screens/home_screen.dart';
import 'package:desa_merdeka/Desa/screens/reset_password.dart';
import 'package:desa_merdeka/Desa/screens/signup_screen.dart';
import 'package:desa_merdeka/Desa/utils/color_utils.dart';

import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green.shade800,
          leading: logoWidget("assets/images/DesaMerdeka.png"),
          title: Text(
            'DESA MERDEKA',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.grey),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/DesaMerdeka.png"),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Sign In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DesaMerdeka()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.black)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }

  // _signin(String _email, String _password) async {
  //   try {
  //     //Create Get Firebase Auth User
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: _email, password: _password);
  //     //Success
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => DesaMerdeka()));
  //   } on FirebaseAuthException catch (error) {
  //     Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
  //   }
  // }

  // _signup(String _email, String _password) async {
  //   try {
  //     //Create Get Firebase Auth User
  //     await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: _email, password: _password);

  //     //Success
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => DesaMerdeka()));
  //   } on FirebaseAuthException catch (error) {
  //     Fluttertoast.showToast(
  //       msg: error.message,
  //       gravity: ToastGravity.TOP,
  //     );
  //   }
  // }
}
