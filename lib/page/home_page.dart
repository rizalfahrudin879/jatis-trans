import 'package:app/model/route.dart';
import 'package:app/page/route_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';

import 'pool_page.dart';

class HomePage extends StatefulWidget {
  final RouteSet routeSet;

  HomePage({this.routeSet});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dariName;
  var dariId;
  var keName;
  var keId;
  var _dariName;
  var _dariId;
  var _keName;
  var _keId;
  int dariKe;

  var date = TextEditingController();

  final format = DateFormat("yyyy-MM-dd");
  @override
  void initState() {
    super.initState();
    setState(() {
      dariKe = 0;
    });
  }

  void awaitReturndata(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Pool(),
      ),
    );

    setState(() {
      dariName = '${result['city_name']} - ${result['pool_name']} ';
      dariId = '${result['pool_id']}';
    });
  }

  void awaitReturndata2(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Pool(),
      ),
    );

    setState(() {
      keName = '${result['city_name']} - ${result['pool_name']} ';
      keId = '${result['pool_id']}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      color: Colors.orange[400],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: CarouselSlider(
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 2),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          pauseAutoPlayOnTouch: Duration(seconds: 5),
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          items: [
                            'images/promo01.png',
                            'images/promo02.png',
                            'images/promo03.png'
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  height: 70,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  // padding: EdgeInsets.only(right: 20,left: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.transparent,
                                  ),
                                  child: Image.asset(
                                    (i),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5, left: 5),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 5),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Dari',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              new ListTile(
                                  title: new Text((dariName == null)
                                      ? 'Keberangkatan'
                                      : dariName.toString()),
                                  leading: Icon(
                                    Icons.location_city,
                                    color: Colors.blue[800],
                                  ),
                                  onTap: () {
                                    awaitReturndata(context);
                                  }),
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Container(
                                          width: 250,
                                          child: Divider(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 0),
                                          child: Container(
                                            child: CircleAvatar(
                                              child: IconButton(
                                                icon: Icon(Icons.import_export),
                                                onPressed: () {
                                                  if (dariKe == 0) {
                                                    dariKe = 1;
                                                    setState(() {
                                                      _dariName = dariName;
                                                      _dariId = dariId;
                                                      dariName = keName;
                                                      dariId = keId;
                                                      _keName = keName;
                                                      _keId = keId;
                                                      keName = _dariName;
                                                    });
                                                  } else {
                                                    dariKe = 0;
                                                    setState(() {
                                                      dariName = _dariName;
                                                      dariId = _dariId;
                                                      keName = _keName;
                                                      keId = _keId;
                                                    });
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Ke',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              ListTile(
                                  title: Text((keName == null)
                                      ? 'Tujuan'
                                      : keName.toString()),
                                  leading: Icon(
                                    Icons.location_city,
                                    color: Colors.blue[800],
                                  ),
                                  onTap: () {
                                    awaitReturndata2(context);
                                  }),
                              Divider(
                                color: Colors.grey,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Tanggal keberangkatan',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(right: 10, left: 18),
                                child: DateTimeField(
                                  controller: date,
                                  format: format,
                                  decoration: InputDecoration(
                                    //  prefixIcon: Icon(Icons.email,color: Colors.lightBlueAccent,),
                                    hintText: 'Masukkan Tanggal',
                                    border: InputBorder.none,
                                    icon: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: Colors.blue[800],
                                      ),
                                    ),
                                    hintStyle: TextStyle(color: Colors.black),
                                  ),
                                  // format: format,
                                  onShowPicker: (context, currentValue) {
                                    return showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1900),
                                        initialDate:
                                            currentValue ?? DateTime.now(),
                                        lastDate: DateTime(2100));
                                  },
                                ),
                              ),
                              Divider(
                                color: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  color: Colors.orange[400],
                  child: Text(
                    'CARI',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  onPressed: () {
                    debugPrint('${date.text}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => RoutePage(
                          dariId: '$dariId',
                          keId: '$keId',
                          date: '${date.text}',
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
