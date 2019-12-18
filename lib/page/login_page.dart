
import 'package:app/bloc/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:app/bloc/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'registration_page.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
        child: LoginPage(),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      ));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('username dan password tidak boleh kosong'),
        backgroundColor: Colors.red,
      ));
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
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          ));
        }

        if (state is LoginHome) {
          BlocProvider.of<AuthBloc>(context).add(LoggedIn(
              userName: state.userName,
              email: _controllerEmail.text,
              password: _controllerPassword.text));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/logo.png',
                        height: 150,
                      ),
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
                                    validator: (e) {
                                      if (e.isEmpty)
                                        return 'Email tidak boleh kosong';
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
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
                                        if (e.isEmpty)
                                          return "password tidak boleh kosong";
                                        return null;
                                      }),
                                  SizedBox(height: 10,),
                                  RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: Colors.orange[400],
                                    child: Text(
                                      "Login",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: state is! LoginLoading
                                        ? _validateInputs
                                        : null,
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    child: state is LoginLoading
                                        ? CircularProgressIndicator()
                                        : null,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Belum punya akun?',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          Regis()));
                                        },
                                        child: Text(
                                          '  Registrasi',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 15),
                                        ),
                                      )
                                    ],
                                  )
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
            ),
          );
        },
      ),
    );
  }
}
