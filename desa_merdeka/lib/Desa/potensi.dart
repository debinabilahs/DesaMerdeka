import 'package:desa_merdeka/Desa/screens/home_screen.dart';
import 'package:flutter/material.dart';

class PagePotensi extends StatelessWidget {
  const PagePotensi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PotensiDesa(),
    );
  }
}

class PotensiDesa extends StatelessWidget {
  const PotensiDesa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: Text("Desa Merdeka"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Icon(
              Icons.menu,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Potensi Umum Desa",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Pilih salah satu"),
              ],
            ),
          ),
          Potensi(potensi: "Pertanian", value: true),
          Potensi(potensi: "Perkebunan", value: false),
          Potensi(potensi: "Kehutanan", value: false),
          Potensi(potensi: "Peternakan", value: false),
          Potensi(potensi: "Wisata", value: false),
          Potensi(potensi: "Perikanan", value: false),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Input"),
            ),
          )
        ],
      ),
    );
  }
}

class Potensi extends StatelessWidget {
  Potensi({super.key, required this.potensi, required this.value});
  bool value;
  String potensi;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      height: 75,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 146, 128, 128)),
        child: Row(
          children: [
            Checkbox(
                value: value,
                onChanged: (value) {},
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.black.withOpacity(.32);
                  }
                  return Colors.black;
                })),
            Text(potensi),
          ],
        ),
      ),
    );
  }
}
