import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String checkUsername = prefs.getString('email');

    if (event is AppStarted) {

      if (checkUsername != null) {
        yield AuthAuthenticated();
      } else {
        yield AuthUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      prefs.setString('username', event.userName);
      prefs.setString('email', event.email);
      yield AuthAuthenticated();
    }

    if (event is LoggedOut) {
      prefs.remove('email');
      prefs.remove('username');
      yield AuthUnauthenticated();
    }
  }
}
