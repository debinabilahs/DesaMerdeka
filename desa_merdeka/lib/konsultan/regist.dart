import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
  bool isHidden = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("DESA MERDEKA"),
        backgroundColor: Colors.red,
      ),
      body: ListView(
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
            'images/DesaMerdeka.png',
            height: 100,
            width: 100,
          ),
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
          TextField(
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
            onPressed: () {
              print("LOGIN DENGAN : EMAIL (${emailC}) & PASSWORD (${passC})");
            },
            child: Text("LOGIN"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red[500],
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Anda belum memilik akun?',
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              ' Registrasi!',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
