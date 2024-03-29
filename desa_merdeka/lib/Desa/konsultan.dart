import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Konsultasi extends StatelessWidget {
  Konsultasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.green.shade800,
        title: Text(
          'DESA MERDEKA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 325,
                height: 75,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 30, 150, 50),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Pilih Konsultan",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 325,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 225, 225, 225),
                ),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Konsultan("Konsultan A", "+6281234567890"),
                    Konsultan("Konsultan B", "+6281234567891"),
                    Konsultan("Konsultan C", "+6281234567892"),
                    Konsultan("Konsultan D", "+6281234567893"),
                    Konsultan("Konsultan E", "+6281234567894"),
                    Konsultan("Konsultan F", "+6281234567895"),
                    Konsultan("Konsultan G", "+6281234567896"),
                    Konsultan("Konsultan H", "+6281234567897"),
                    Konsultan("Konsultan I", "+6281234567898"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Konsultan extends StatelessWidget {
  Konsultan(this.text, this.phoneNumber);

  final String text;
  final String phoneNumber;

  void _openWhatsApp() async {
    String url = "https://wa.me/$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            color: Color.fromARGB(255, 187, 186, 186),
          ),
          Container(
            height: 75,
            width: 250,
            color: Colors.white,
            child: GestureDetector(
              onTap: _openWhatsApp,
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Expanded(child: Text(text)),
                  Icon(Icons.chat_bubble, color: Colors.green.shade800),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
