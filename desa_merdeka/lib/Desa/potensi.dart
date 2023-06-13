import 'package:desa_merdeka/Desa/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'hasil.dart';

class PotensiDesa extends StatefulWidget {
  const PotensiDesa({super.key});

  @override
  State<PotensiDesa> createState() => _PotensiDesaState();
}

class _PotensiDesaState extends State<PotensiDesa> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    Future<void> forwardChaining(List<String> conditions) async {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('tb_ciri')
          .where('1',
              isEqualTo: true) // Initial condition to retrieve all documents
          .limit(1)
          .get();

      String id = '';
      List<List<String>> rules = [
        ['C007', 'C008', 'C009', 'C010', 'C011', 'C012'],
        ['C001', 'C002', 'C003', 'C005'],
        ['C003', 'C005', 'C006'],
        ['C004', 'C011', 'C012', 'C013'],
        ['C002', 'C003', 'C005', 'C014'],
      ];

      bool status = false;
      List<String> ruleInput = conditions;

      for (int i = 0; i < rules.length; i++) {
        bool result = (ruleInput == rules[i]);
        if (result) {
          status = true;
          break;
        }
      }

      if (status) {
        if (snapshot.size > 0) {
          id = snapshot.docs[0].id;

          DocumentSnapshot<Map<String, dynamic>> klasifikasiDesa =
              await FirebaseFirestore.instance
                  .collection('tb_klasifikasi')
                  .doc(id)
                  .get();

          if (klasifikasiDesa.exists) {
            String desa = klasifikasiDesa['klasifikasi'];
            String info = klasifikasiDesa['info'];
            String saran = klasifikasiDesa['saran_pelatihan'];

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    PageHasil(desa: desa, info: info, saran: saran),
              ),
            );
          } else {
            // Include the error handling code
            // ...
          }
        }
      } else {
        // Include the error handling code
        // ...
      }
    }

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
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            height: 500,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('tb_ciri_1')
                  .orderBy('kode', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                List<CheckboxListTile> checkboxes =
                    snapshot.data!.docs.map((doc) {
                  String item = doc['ciri'];
                  String kode = doc['kode'];

                  return CheckboxListTile(
                    title: Text(item),
                    value: selectedItems.contains(kode),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null && value) {
                          selectedItems.add(kode);
                        } else {
                          selectedItems.remove(kode);
                        }
                      });
                    },
                  );
                }).toList();
                return ListView(
                  children: checkboxes,
                  shrinkWrap: true,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                List<String> conditions = selectedItems;
                forwardChaining(conditions);
                print(conditions);
                selectedItems.clear();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PageHasil(),
                  ),
                );
              },
              child: Text("Input"),
            ),
          )
        ],
      ),
    );
  }
}
