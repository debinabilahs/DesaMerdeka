import 'package:flutter/material.dart';
import 'account_page.dart';
import 'login.dart';
import 'message_page.dart';
import 'notif_page.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  final screens = [
    HomePage(),
    MessagePage(),
    NotifPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    color: Colors.black,
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
                    color: Colors.black,
                  )
                : Icon(
                    Icons.message_outlined,
                    color: Colors.white,
                  ),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: currentPage == 2
                ? Icon(
                    Icons.notifications,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: currentPage == 3
                ? Icon(
                    Icons.person,
                    color: Colors.black,
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
