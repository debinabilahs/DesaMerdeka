import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:desa_merdeka/Desa/screens/home_screen.dart';

class PagePelatihan extends StatelessWidget {
  PagePelatihan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PagePelatihanDesa(),
    );
  }
}

class PagePelatihanDesa extends StatelessWidget {
  PagePelatihanDesa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
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
                    child: Column(
                      children: [
                        Text(
                          "Pilih Pelatihan",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
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
                              Pelatihan("Pelatihan A", "+6281234567890"),
                              Pelatihan("Pelatihan B", "+6281234567891"),
                              Pelatihan("Pelatihan C", "+6281234567892"),
                              Pelatihan("Pelatihan D", "+6281234567893"),
                              Pelatihan("Pelatihan E", "+6281234567894"),
                              Pelatihan("Pelatihan F", "+6281234567894"),
                              Pelatihan("Pelatihan G", "+6281234567894"),
                              Pelatihan("Pelatihan H", "+6281234567894"),
                              Pelatihan("Pelatihan I", "+6281234567894"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // child: ListView(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   children: [
                  //     Pelatihan("  Pelatihan A"),
                  //     Pelatihan("  Pelatihan B"),
                  //     Pelatihan("  Pelatihan C"),
                  //     Pelatihan("  Pelatihan D"),
                  //     Pelatihan("  Pelatihan E"),
                  //     Pelatihan("  Pelatihan F"),
                  //     Pelatihan("  Pelatihan G"),
                  //     Pelatihan("  Pelatihan H"),
                  //     Pelatihan("  Pelatihan I"),
                  //   ],
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Pelatihan extends StatelessWidget {
  Pelatihan(this.text, this.phoneNumber);

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
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward),
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
