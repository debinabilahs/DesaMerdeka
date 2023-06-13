import 'package:desa_merdeka/Desa/reusable_widgets/reusable_widget.dart';
import 'package:desa_merdeka/Desa/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ProfilDesa extends StatelessWidget {
  const ProfilDesa({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DesaMerdeka()),
            );
          },
        ),
        backgroundColor: Colors.green.shade800,
        title: Text(
          'DESA MERDEKA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Container(
            height: 230,
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Desa ini merupakan salah satu desa di kecamatan ... Kabupaten ...",
                  ),
                  Text(
                    "Desa ini sendiri sudah memiliki beberapa potensi namun desa belum maksimal dalam mengembangkannya",
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              children: [
                DataDesa(
                  jumlah: '9999999',
                  keterangan: 'Jumlah Penduduk',
                  icon: Icons.person,
                ),
                DataDesa(
                  jumlah: '100',
                  keterangan: 'Jumlah Bangunan',
                  icon: Icons.house,
                ),
                DataDesa(
                  jumlah: '1002123',
                  keterangan: 'Luas Wilayah',
                  icon: Icons.map_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataDesa extends StatelessWidget {
  DataDesa({
    Key? key,
    required this.jumlah,
    required this.keterangan,
    required this.icon,
  });

  String jumlah;
  String keterangan;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Icon(icon, size: 30),
              ),
              Text(
                jumlah,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 3,
          ),
          Text(
            keterangan,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
