import 'potensi.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PageHasil extends StatelessWidget {
  String? desa;
  String? info;
  String? saran;
  PageHasil({super.key, desa, info, saran});
  

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HASIL SURVEY',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'KLASIFIKASI DESA    ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Expanded(
                          child: TextField(
                            maxLines: 1,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: desa,
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'INFO DESA              ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Expanded(
                          child: TextField(
                            maxLines: 6,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SARAN PELATIHAN ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Expanded(
                          child: TextField(
                            maxLines: 6,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add your printing logic here
                },
                child: Text('CETAK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
