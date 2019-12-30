import 'package:app/bloc/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Content { P, W }
Content content;
String media;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var email;
  var userName;
  getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('username');
      email = prefs.getString('email');
    });
  }

  @override
  void initState() {
    super.initState();
    getValue();
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: new Text("Anda yakin ingin Keluar"),
      actions: <Widget>[
        new RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: new Text(
              "Batal",
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.orangeAccent,
            onPressed: () => Navigator.pop(context)),
        SizedBox(
          height: 30,
        ),
        new RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: new Text("Iya", style: new TextStyle(color: Colors.white)),
          color: Colors.orangeAccent,
          onPressed: () async {
            BlocProvider.of<AuthBloc>(context).add(LoggedOut());

            Navigator.pop(context);
          },
        ),
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile1()));
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 240, 242, 246),
                      child: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 192, 204, 218),
                      ),
                      radius: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text((userName == null) ? '' : '$userName'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  (email == null) ? '' : '$email',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PenumpangPendamping()));
                    },
                    leading: Text('Penumpang Pendamping'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Bantuan()));
                    },
                    leading: Text('Bantuan'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TentangKami()));
                    },
                    leading: Text('Tentang Kami'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HubungiKami()));
                    },
                    leading: Text('Hubungi Kami'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Pengaturan()));
                    },
                    leading: Text('Pengaturan'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              confirm();
            },
            child: Container(
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: Text('Logout'),
                ),
              ),
            ),
          )
        ],
      ),
    )
        // body: Text('${state.email}')
        );
  }
}

class Bantuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Bantuan'),
        elevation: 0.0,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 15, right: 10),
        child: Column(
          children: <Widget>[
            Text(
              'Hey Kamu, Apa ada yang bisa kami bantu?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Ask1()));
                          },
                          title: Text(
                              'Apakah Jatis Trans Menerima pembayaran mata uang asing?',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.start),
                          contentPadding: EdgeInsets.only(left: 20, right: 5),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Ask2()));
                        },
                        title: Text('Apa itu kode promo?',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.start),
                        contentPadding: EdgeInsets.only(left: 20, right: 5),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Ask3()));
                          },
                          title: Text(
                              'Apakah nama pemesan harus sama dengan nama penumpang?',
                              maxLines: 2,
                              style: TextStyle(fontSize: 16)),
                          // leading: Text('Apakah nama pemesan harus sama dengan nama pendamping?',maxLines: 2 ,style: TextStyle(fontSize: 16)),
                          contentPadding: EdgeInsets.only(left: 20, right: 5),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Profile1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Profile'),
        elevation: 0.0,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 8, right: 10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 350,
              child: Card(
                // color:  Color.fromARGB(255, 255, 189, 57),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Data Diri Pribadi',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20)),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                                child: Text('Edit',
                                    style: TextStyle(color: Colors.blue)),
                                onTap: () {}),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 20,
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Colors.grey[200],
                                              child: Icon(Icons.person,
                                                  size: 25, color: Colors.grey),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text('Nama',
                                                      style: TextStyle(
                                                          color: Colors.grey)),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 71, bottom: 35),
                                        child: Text('Umur',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 71),
                                        child: Text('Gender',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 59),
                                        child: Row(
                                          children: <Widget>[
                                            Radio(
                                              value: Content.P,
                                              groupValue: content,
                                              onChanged: (Content value) {},
                                            ),
                                            Text('P'),
                                            Radio(
                                              value: Content.W,
                                              groupValue: content,
                                              onChanged: (Content value) {},
                                            ),
                                            Text('W')
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 71),
                                        child: Text('No Ponsel',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 71),
                                        child: Text('0249249852'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              child: GestureDetector(
                onTap: () {
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => BusScreen()));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      children: <Widget>[
                        Text('Change Email'),
                        Spacer(),
                        Icon(Icons.arrow_right)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PenumpangPendamping extends StatelessWidget {
  final _controllerName = TextEditingController();
  final _controllerAge = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Co-Passengers'),
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, top: 15, right: 5),
        child: Card(
          child: Container(
            height: 240,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        controller: _controllerName,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 15),
                            labelText: 'Nama'),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text('Gender',
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black54))),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: Content.P,
                            groupValue: content,
                            onChanged: (Content value) {},
                          ),
                          Text('Pria'),
                          Radio(
                            value: Content.W,
                            groupValue: content,
                            onChanged: (Content value) {},
                          ),
                          Text('Wanita')
                        ],
                      ),
                      TextField(
                        controller: _controllerAge,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 15),
                            labelText: 'Umur',
                            hintText: 'Please enter the age'),
                      )
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

class Ask1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('#1'),
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('FAQ',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text('Pembayaran',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                  'Apakah Jatis trans menerima pembayaran mata uang asing?',
                  style: TextStyle(fontSize: 17)),
            ),
            Text(
                'Untuk saat ini Jatis Trans baru bisa melayani pembayaran menggunakan kartu kredit atau secara online.',
                style: TextStyle(fontSize: 17))
          ],
        ),
      ),
    );
  }
}

class Ask2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('#2'),
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('FAQ',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text('Kode Promo',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child:
                  Text('Apa itu Kode Promo?', style: TextStyle(fontSize: 17)),
            ),
            Text('Kode Promo adalah kode untuk mendapatkan potongan harga.',
                style: TextStyle(fontSize: 17))
          ],
        ),
      ),
    );
  }
}

class Ask3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('#3'),
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('FAQ',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text('Cara Pesan',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                  'Apakah nama pemesan harus sama dengan nama penumpang?',
                  style: TextStyle(fontSize: 17)),
            ),
            Text(
                'Tidak. Karena nama pemesan tidak harus sama dengan nama penumpang, nama penumpang bisa diatur dengan cara mengisi formulir yang sudah disediakan',
                style: TextStyle(fontSize: 17))
          ],
        ),
      ),
    );
  }
}

class TentangKami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Tentang Kami'),
        elevation: 0.0,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.only(
              top: 160,
            ),
            child: Column(
              children: <Widget>[
                Image.asset('images/logo.png', height: 180),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text('Version Beta 0.0.1'),
                      Text('@2019 Indivara Group'),
                      Text('Team Flutter')
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class HubungiKami extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Hubungi Kami'),
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.blue[100],
                radius: 100,
                child: Image.asset('images/callcenter.png', height: 250),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  // height: 300,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.blue[800],
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(
                                'Kirana Boutique Office Blok G 3 No 1-2, Jl Kirana Avenue, Klp Gading, Kota  Jkt Utara, Daerah Khusus Ibukota Jakarta 14240, Jakarta'),
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.watch_later,
                            color: Colors.blue[800],
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text('Buka Pukul : 08.30 - 17.30 WIB'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text('Hari             : Senin - Jumat'),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(
                            Icons.phone,
                            color: Colors.blue[800],
                          ),
                          title: Text('+62212245573'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pengaturan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Pengaturan'),
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                onTap: () {},
                title: Text('Negara'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {},
                title: Text('Bahasa'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
