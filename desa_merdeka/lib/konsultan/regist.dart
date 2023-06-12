import 'dart:convert';

import 'package:flutter/material.dart';
import 'login_konsul.dart';
import 'package:http/http.dart' as http;

class Registrasi extends StatelessWidget {
  Registrasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fromkey = GlobalKey<FormState>();

  bool isHidden = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController namaC = TextEditingController();
  TextEditingController bidangC = TextEditingController();
  TextEditingController no_hpC = TextEditingController();
  TextEditingController statusC = TextEditingController();

  Future _simpan() async {
    // ignore: unused_local_variable
    final response = await http
        .post(Uri.parse('http://192.168.65.93/login/regist.php'), body: {
      "email": emailC.text,
      "password": passC.text,
      "nama": namaC.text,
      "bidang": bidangC.text,
      "no_hp": no_hpC.text,
      "status": statusC.text,
    });
    // ignore: unused_local_variable
    var dataUser = json.decode(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("DESA MERDEKA"),
        backgroundColor: Colors.green.shade800,
      ),
      body: Form(
        key: fromkey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(
              'REGISTRASI',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              'images/DesaMerdeka.jpg',
              height: 100,
              width: 100,
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: emailC,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                label: Text("Email"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                prefix: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: namaC,
              autocorrect: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  label: Text("Masukan nama anda"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  prefix: Icon(Icons.person)),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: bidangC,
              autocorrect: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text("Masukan Bidang Anda"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                prefix: Icon(Icons.work),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: no_hpC,
              autocorrect: false,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text("Masukan Nomer Telepon anda"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                prefix: Icon(Icons.phone_android),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: statusC,
              autocorrect: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text("Masukan Status anda"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                prefix: Icon(Icons.book),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passC,
              autocorrect: false,
              obscureText: isHidden,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                prefix: Icon(Icons.vpn_key),
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
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ), 
                onPressed: () {
                  if (fromkey.currentState!.validate()) {
                    _simpan().then(
                      (value) {
                        if (value) {
                          // ignore: unused_local_variable
                          final snackBar = SnackBar(
                            content: const Text('Data berhasil di simpan'),
                          );
                        } else {
                          // ignore: unused_label
                          content:
                          const Text('Data tidak berhasil di simpan');
                        }
                      },
                    );
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: ((context) => Login())),
                        (route) => false);
                  }
                },
                child: Text("Login")),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Anda sudah memiliki akun?',
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                'Login!',
                style: TextStyle(color: Color.fromARGB(255, 33, 44, 243)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
