import 'dart:async';

import 'package:app/bloc/auth/auth.dart';
import 'package:app/bloc/regis/regis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Regis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisBloc(),
        child: RegisPage(),
      ),
    );
  }
}

class RegisPage extends StatefulWidget {
  @override
  _RegisPageState createState() => _RegisPageState();
}

class _RegisPageState extends State<RegisPage> {
  final _controllerUserName = TextEditingController();
  final _controllerPhoneNo = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      BlocProvider.of<RegisBloc>(context).add(RegisButtonPressed(
        userName: _controllerUserName.text,
        phoneNo: _controllerPhoneNo.text,
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      ));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Tidak boleh kosong'),
        backgroundColor: Colors.red,
      ));
    }
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pop();
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (value.isNotEmpty) {
      if (!regex.hasMatch(value)) {
        return 'Email tidak valid';
      } else {
        return null;
      }
    }
  }


  bool _idHidePassword = true;
  void passwordVisibility() {
    setState(() {
      _idHidePassword = !_idHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisBloc, RegisState>(
      listener: (context, state) {
        if (state is RegisFailure) {
          setState(() {
            startTime();
          });

          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('Email sudah terdaftar, silahkan login'),
            backgroundColor: Colors.red,
          ));
        }

        if (state is RegisHome) {
          BlocProvider.of<AuthBloc>(context).add(
            LoggedIn(
              userName: state.userName,
              email: _controllerEmail.text,
              password: _controllerPassword.text,
            ),
          );
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<RegisBloc, RegisState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orangeAccent,
              title: Text('Registrasi'),
            ),
            body: ListView(
              children: <Widget>[
                SizedBox(height: 20),
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Form(
                              key: _formKey,
                              autovalidate: true,
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                      controller: _controllerUserName,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        prefixIcon: Icon(Icons.person),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        hintText: 'Nama',
                                        labelText: 'Nama',
                                      ),
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return 'Nama tidak boleh kosong';
                                        } else if (e.length < 4) {
                                          return "Nama minimal 4 karakter ";
                                        } else {
                                          return null;
                                        }
                                      }),
                                  SizedBox(height: 15),
                                  TextFormField(
                                    controller: _controllerPhoneNo,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        prefixIcon: Icon(Icons.phone),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        hintText: 'no hp',
                                        labelText: 'No hp'),
                                    validator: (e) {
                                      if (e.isEmpty) {
                                        return 'No hp tidak boleh kosong';
                                      } else {
                                        if (e.length <= 11) {
                                          return 'No Hp tidak valid';
                                        } else {
                                          return null;
                                        }
                                      }
                                    },
                                  ),
                                  SizedBox(height: 15),
                                  TextFormField(
                                    controller: _controllerEmail,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        prefixIcon: Icon(Icons.mail),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        hintText: 'email',
                                        labelText: 'Email'),
                                    validator: validateEmail,
                                  ),
                                  SizedBox(height: 15),
                                  TextFormField(
                                      obscureText: _idHidePassword,
                                      controller: _controllerPassword,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10),
                                          prefixIcon: Icon(Icons.lock),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              passwordVisibility();
                                            },
                                            child: Icon(
                                                _idHidePassword
                                                    ? Icons.visibility_off
                                                    : Icons.visibility,
                                                color: _idHidePassword
                                                    ? Colors.grey
                                                    : Colors.lightBlueAccent),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          hintText: 'password',
                                          labelText: 'Password'),
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return "password tidak boleh kosong";
                                        } else {
                                          if (e.length < 4) {
                                            return 'Password Minimal 4 Karakter';
                                          }
                                          return null;
                                        }
                                      }),
                                  SizedBox(height: 10,)
,                                  RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: Colors.orange[400],
                                    child: Text(
                                      "Registrasi",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: state is! RegisLoading
                                        ? _validateInputs
                                        : null,
                                  ),
                                  Container(
                                    child: state is RegisLoading
                                        ? CircularProgressIndicator()
                                        : null,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
