import 'package:flutter/material.dart';


class Konsultasi extends StatelessWidget {
  Konsultasi({Key? key}) : super(key: key);

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
                    color: Color.fromARGB(255, 134, 33, 26),
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
                      Konsultan("  Konsultan A"),
                      Konsultan("  Konsultan B"),
                      Konsultan("  Konsultan C"),
                      Konsultan("  Konsultan D"),
                      Konsultan("  Konsultan E"),
                      Konsultan("  Konsultan F"),
                      Konsultan("  Konsultan G"),
                      Konsultan("  Konsultan H"),
                      Konsultan("  Konsultan I"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Konsultan extends StatelessWidget {
  Konsultan(this.text);

  String text;

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
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
