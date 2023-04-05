import 'package:desa_merdeka/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DesaMerdeka());
}

class DesaMerdeka extends StatelessWidget {
  const DesaMerdeka({super.key});

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
        backgroundColor: Color.fromARGB(255, 210, 0, 26),
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
            child: Column(
              children: [
                Text("Pilih Potensi Umum Desa"),
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
                    return Colors.orange.withOpacity(.32);
                  }
                  return Colors.orange;
                })),
            Text(potensi),
          ],
        ),
      ),
    );
  }
}
