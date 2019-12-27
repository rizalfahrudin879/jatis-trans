import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget{
  @override
  PaymentPageState createState()=> PaymentPageState();
}
class PaymentPageState extends State<PaymentPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Metode Pembayaran'),
      ),
      body: ListView(
        children: <Widget>[
          SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.only(right: 30,left: 30,top: 30),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: RaisedButton(
                              color: Colors.orange[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "B C A",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30,left: 30,top: 15),

                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: RaisedButton(
                              color: Colors.orange[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "B N I",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(right: 30,left: 30,top: 15),
                    child: Row(
                      children: <Widget>[
                        Expanded(

                          child: SizedBox(
                            height: 45,
                            child: RaisedButton(
                              color: Colors.orange[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "CIMB NIAGA",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30,left: 30,top: 15),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: RaisedButton(
                              color: Colors.orange[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "B R I",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30,left: 30,top: 15),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: RaisedButton(
                              color: Colors.orange[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "DANAMON",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 190,),
                  Column(
                    children: <Widget>[
                      Container(

                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "Syarat dan Ketentuan",
                                                style: TextStyle(
                                                    fontSize: 15, fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 30,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    "Tiket yang dipesan dapat dibatalkan 1 hari sebeleumnya",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xff8a8a8a),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    "keberangkatan dengan denda Rp.20.000 per tiket",
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xff8a8a8a),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),

                      )
                    ],
                  )
                ],
              )
          ),
        ],
      ),
    );

  }
}