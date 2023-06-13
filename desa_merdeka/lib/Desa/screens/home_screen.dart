import 'package:desa_merdeka/Desa/kerja_sama.dart';
import 'package:desa_merdeka/Desa/konsultan.dart';
import 'package:desa_merdeka/Desa/pelatihan.dart';
import 'package:desa_merdeka/Desa/potensi.dart';
import 'package:desa_merdeka/Desa/pages/account_page.dart';
import 'package:desa_merdeka/Desa/pages/message_page.dart';
import 'package:desa_merdeka/Desa/pages/notif_page.dart';
import 'package:desa_merdeka/Desa/profile_desa.dart';
import 'package:desa_merdeka/Desa/reusable_widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DesaMerdeka extends StatelessWidget {
  const DesaMerdeka({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desa Merdeka',
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, String? email});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  final screens = [
    HomePage(),
    MessagePage(),
    // NotifPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green.shade800,
          leading: logoWidget("assets/images/Desa_Merdeka.png"),
          title: Text(
            'DESA MERDEKA',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          //     child: Icon(
          //       Icons.menu,
          //     ),
          //   ),
          // ],
          ),
      body: IndexedStack(
        index: currentPage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.green.shade800,
        selectedItemColor: Colors.white,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: currentPage == 0
                ? Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 222, 252, 153),
                  )
                : Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: currentPage == 1
                ? Icon(
                    Icons.message,
                    color: Color.fromARGB(255, 222, 252, 153),
                  )
                : Icon(
                    Icons.message_outlined,
                    color: Colors.white,
                  ),
            label: "Message",
          ),
          // BottomNavigationBarItem(
          //   icon: currentPage == 2
          //       ? Icon(
          //           Icons.notifications,
          //           color: Color.fromARGB(255, 222, 252, 153),
          //         )
          //       : Icon(
          //           Icons.notifications_outlined,
          //           color: Colors.white,
          //         ),
          //   label: "Notifications",
          // ),
          BottomNavigationBarItem(
            icon: currentPage == 3
                ? Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 222, 252, 153),
                  )
                : Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
            label: "Account",
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
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
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    width: 350,
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
                    width: 350,
                    height: 230,
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                    ),
                    child: Wrap(
                      runSpacing: 2,
                      spacing: 3,
                      alignment: WrapAlignment.center,
                      children: [
                        Menu(
                          menu: "Profil desa",
                          icon: Icons.home,
                          page: () => ProfilDesa(),
                        ),
                        Menu(
                          menu: "Potensi desa",
                          icon: Icons.bar_chart,
                          page: () => PotensiDesa(),
                        ),
                        Menu(
                          menu: "Konsultasi",
                          icon: Icons.chat,
                          page: () => Konsultasi(),
                        ),
                        Menu(
                          menu: "Pelatihan",
                          icon: Icons.menu_book_rounded,
                          page: () => PagePelatihan(),
                        ),
                        Menu(
                          menu: "Kerja sama",
                          icon: Icons.handshake,
                          page: () => KerjasamaForm(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 390,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Text(
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                            "Daftar Konsultan",
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 20,
                          children: [
                            Berita(
                              "Debi NS",
                              "https://i.pravatar.cc/150?img=47",
                              "Konsultan Bidang Pertanian",
                            ),
                            Berita(
                              "Broto S",
                              "https://i.pravatar.cc/301",
                              "Konsultan Bidang Perkebunan",
                            ),
                            Berita(
                              "Fadly FS",
                              "https://i.pravatar.cc/302",
                              "Konsultan Bidang Perikanan",
                            ),
                            Berita(
                              "Kaela Tirta",
                              "https://i.pravatar.cc/303",
                              "Konsultan Bidang Kehutanan",
                            ),
                            Berita(
                              "Ambarita",
                              "https://i.pravatar.cc/304",
                              "Konsultan Bidang Pariwisata",
                            ),
                            Berita(
                              "Bli Suwung",
                              "https://i.pravatar.cc/305",
                              "Konsultan Bidang Pertanian",
                            ),
                            Berita(
                              "Poppi",
                              "https://i.pravatar.cc/306",
                              "Konsultan Bidang Kehutanan",
                            ),
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
  }
}

class Menu extends StatelessWidget {
  Menu({super.key, required this.menu, required this.icon, required this.page});
  String menu;
  IconData icon;
  Widget Function() page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return page();
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Center(
              child: Text(
                menu,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Berita extends StatelessWidget {
  Berita(this.nama, this.ppicture, this.desc);

  String nama;
  String ppicture;
  String desc;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            height: screenHeight * 0.25,
            width: screenWidth * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(ppicture),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Text(
                  nama,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(desc, textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
