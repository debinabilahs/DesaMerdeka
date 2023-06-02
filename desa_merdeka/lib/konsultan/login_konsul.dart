import 'dart:convert';
import 'package:desa_merdeka/Desa/home.dart';
import 'package:desa_merdeka/konsultan/profile_konsultan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'regist.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isHidden = true;

  String? email, password, status;

  TextEditingController emailC = new TextEditingController();
  TextEditingController passC = new TextEditingController();

  set alert(String alert) {}

  void ProsesLogin() async {
    final response = await http.post(
        Uri.parse("http://192.168.56.1/login/login1.php"),
        body: {"email": emailC.text, "password": passC.text});
    var dataUser = jsonDecode(response.body);
    print(dataUser);

    if (dataUser.length < 1) {
      setState(() {
        alert = "Data User Tidak ada";
      });
    } else {
      setState(() {
        email = dataUser[0]["email"];
        password = dataUser[0]["password"];
        status = dataUser[0]["status"];
      });
      if (status == "konsultan") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => profile(email: email),
          ),
        );
      } else if (status == "desa") {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(
                email: email,
              ),
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.green.shade800,
          title: Text('DESA MERDEKA'),
          centerTitle: false,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: <Widget>[
            Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(5),
                child: Image.asset("images/DesaMerdeka.jpg")),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white),
              child: TextField(
                controller: emailC,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  labelText: 'Masukan Email anda',
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white),
              child: TextField(
                controller: passC,
                autocorrect: false,
                obscureText: isHidden,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  labelText: " Masukan Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (isHidden == true) {
                        isHidden = false;
                      } else {
                        isHidden = true;
                      }
                      setState(() {});
                    },
                    icon: Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.green.shade800),
                child: Text('Login'),
                onPressed: () {
                  ProsesLogin();
                  /* Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UserProfilePage();
                      },
                    ),
                  ); */
                },
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Belum mempunyai akun?',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Registrasi(),
                  ),
                );
              },
              child: Text(
                'Registrasi!',
                style: TextStyle(color: Color.fromARGB(255, 33, 44, 243)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future<void> debugFillProperties(
      DiagnosticPropertiesBuilder properties) async {
    super.debugFillProperties(properties);
    properties.add(StringProperty('email', email));
  }
}
