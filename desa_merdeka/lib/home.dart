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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        physics: BouncingScrollPhysics(),
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 210, 0, 26),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    width: 300,
                    height: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        "Selamat Datang di Aplikasi Desa Merdeka",
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                    ),
                    child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.0,
                      ),
                      itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.all(7),
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.home),
                            Center(
                              child: Text(
                                "home",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                    ),
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          "BERITA",
                        ),
                        ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 20),
                          children: [
                            Berita("Berita 1", "contoh deskripsi"),
                            Berita("Berita 2", "contoh deskripsi"),
                            Berita("Berita 3", "contoh deskripsi"),
                            Berita("Berita 4", "contoh deskripsi"),
                            Berita("Berita 5", "contoh deskripsi"),
                            Berita("Berita 6", "contoh deskripsi"),
                            Berita("Berita 7", "contoh deskripsi"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}

class Berita extends StatelessWidget {
  Berita(this.judul, this.desc);

  String judul;
  String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.only(top: 7, left: 5, right: 5),
            height: 75,
            width: 225,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
