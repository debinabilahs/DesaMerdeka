import 'package:desa_merdeka/Desa/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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

class Potensi extends StatefulWidget {
  Potensi({super.key, required this.potensi, required this.value});
  bool value;
  String potensi;

  @override
  State<Potensi> createState() => _PotensiState();
}

class _PotensiState extends State<Potensi> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      height: 75,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('tb_ciri_1').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          List<CheckboxListTile> checkboxes = snapshot.data!.docs.map((doc) {
            String item = doc['kode'];

            return CheckboxListTile(
              title: Text(item),
              value: selectedItems.contains(item),
              onChanged: (bool? value) {
                setState(() {
                  if (value != null && value) {
                    selectedItems.add(item);
                  } else {
                    selectedItems.remove(item);
                  }
                });
              },
            );
          }).toList();

          return ListView(
            children: checkboxes,
          );
        },
      ),
    );
  }
}
