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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('DESA MERDEKA'),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.all(5),
                  child: Image.asset("images/DesaMerdeka.png")),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white),
                child: TextField(
                  controller: emailC,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
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
                      backgroundColor: Colors.red),
                  child: Text('Login'),
                  onPressed: () {},
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
                onPressed: () {},
                child: Text(
                  'Registrasi!',
                  style: TextStyle(color: Color.fromARGB(255, 33, 44, 243)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
