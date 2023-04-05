import 'package:flutter/material.dart';
import 'login.dart';

class RegistrasiPage extends StatelessWidget {
  const RegistrasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List data = [
    {
      "judul": "Komunitas",
      "data": 1,
    },
    {
      "judul": "Desa",
      "data": 2,
    },
    {
      "judul": "Perusahaan",
      "data": 3,
    },
  ];

  late int dataAwal;

  @override
  void initState() {
    // TODO: implement initState
    dataAwal = data[1]["data"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('DESA MERDEKA'),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    labelText: 'Masukan Email Anda',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    labelText: 'Nama Pengguna',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value: dataAwal,
                    items: data
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text("${e['judul']}"),
                            value: e['data'] as int,
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        dataAwal = value!;
                      });
                    },
                    hint: Text("Status"),
                    disabledHint: Text("Disabled"),
                    icon: Icon(Icons.arrow_drop_down_circle),
                    isExpanded: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    labelText: 'Masukan Nomor Telepon Anda',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    labelText: 'Buat Password Anda',
                  ),
                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.red),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Registrasi Berhasil",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        backgroundColor: Colors.blueAccent,
                        duration: Duration(seconds: 1),
                        margin: EdgeInsets.all(20),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                  },
                  child: Text('Registrasi'),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Sudah memiliki akun?',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text(
                  'Login!',
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
