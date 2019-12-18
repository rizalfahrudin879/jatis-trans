import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('images/ticket.jpg'),
              
                radius: 70,
              ),
              SizedBox(height: 10,),
              Text("Belum memesan? pesan ticket terlebih dahulu")
            ],
          ),
        ),
      ),
    );
  }
}
