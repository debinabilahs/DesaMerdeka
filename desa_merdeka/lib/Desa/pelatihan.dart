import 'package:flutter/material.dart';

class PagePelatihan extends StatelessWidget {
  PagePelatihan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () =>
              Navigator.of(context, rootNavigator: true).pop(context),
        ),
        backgroundColor: Colors.green.shade800,
        title: Text('Desa Merdeka'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                    "Pilih Pelatihan",
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
                    Pelatihan("  Pelatihan A"),
                    Pelatihan("  Pelatihan B"),
                    Pelatihan("  Pelatihan C"),
                    Pelatihan("  Pelatihan D"),
                    Pelatihan("  Pelatihan E"),
                    Pelatihan("  Pelatihan F"),
                    Pelatihan("  Pelatihan G"),
                    Pelatihan("  Pelatihan H"),
                    Pelatihan("  Pelatihan I"),
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

class Pelatihan extends StatelessWidget {
  Pelatihan(this.text);

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
