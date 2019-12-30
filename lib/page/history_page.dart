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
        child: Container(
          child: ListView(
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Eticket()));
                      },
                      title: Row(
                        children: <Widget>[
                          Image.asset('images/logo.png', height: 110),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Jatis Trans',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                    ),
                                    Text(
                                      'Rp. 200.000',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.airport_shuttle,
                                        color: Colors.grey),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                    ),
                                    Text('Jakarta -- Bandung')
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.confirmation_number,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                    ),
                                    Text('1 Tiket')
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      '21 Januari 2020,',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                    Text('  16.00',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15))
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            right: 65, top: 50)),
                                    Text('Pembelian Berhasil',
                                        style: TextStyle(color: Colors.green)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

class Eticket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange[400],
          title: Text('Detail'),
          leading: InkWell(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          )),
      body: SafeArea(
        child: Container(
            child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Rincian Pemesanan',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                Container(
                  height: 100,
                  child: Card(
                    // color: Colors.orange[50],
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Kode Booking               :'),
                            Text('Nomor Kursi                 :'),
                            Text('Nomor Pemesanan     :'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Jadwal Keberangkatan',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                Card(
                  // color: Colors.orange[50],
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('Jatis Trans'),
                        subtitle: Text('VIP'),
                        trailing: Image.asset('images/logo.png', height: 110),
                      ),
                      Divider(),
                      ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('08.50'),
                            Row(
                              children: <Widget>[
                                Text('Rab, 21 Jan',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 68),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Jakarta'),
                                    Text('Pulogadung',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14))
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            Row(
                              children: <Widget>[
                                Text('10 Jam',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                // Padding(
                                //   padding: const EdgeInsets.only(left: 1),
                                // ),
                                Row(
                                  children: <Widget>[
                                    Image.asset('images/Route1.png',
                                        height: 110),

                                    // Icon(Icons.radio_button_unchecked,
                                    //     color: Colors.blue),
                                    // Text('I'),
                                    // Text('I'),
                                    // Text('I'),
                                    // Text('I'),
                                    // Icon(
                                    //   Icons.radio_button_checked,
                                    //   color: Colors.blue,
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Text('18.50'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Bandung'),
                                    Text('Cicaheum',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 14))
                                  ],
                                ),
                              ],
                            ),
                            Text('Rab, 21 Jan',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Rincian Harga',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                Card(
                  // color: Colors.orange[50],
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Text('Jatis Trans (VIP) x1'),
                        trailing: Text('Rp.200.000,00'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Text('Biaya administrasi'),
                        trailing: Text('Rp.5.000,00'),
                      ),
                      Divider(),
                      ListTile(
                        leading: Text('Asuransi Perjalanan'),
                        trailing: Text('Rp.10.000,00'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
