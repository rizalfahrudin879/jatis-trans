import 'package:flutter/material.dart';
import 'history_page.dart';
import 'home_page.dart';
import 'profile_page.dart';

class NavPage extends StatefulWidget {
  NavPage() : super();
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentI = 0;
  List<Widget> tabs = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];

  onTapped(int index) {
    setState(() {
      currentI = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.orange[400],
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Jatis Trans',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              )
            ],
          ),
        ),
      ),
      body: tabs[currentI],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: currentI,
        fixedColor: Colors.orange[400],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          )
        ],
      ),
    );
  }
}
