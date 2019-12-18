import 'package:app/bloc/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          Card(
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
          Container(
            child: Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Text('Penumpang Pendamping'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text('Bantuan'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text('Tengtang Kami'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(),
                  ListTile(
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
