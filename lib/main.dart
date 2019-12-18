import 'package:app/bloc/auth/auth.dart';
import 'package:app/page/login_page.dart';
import 'package:app/page/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'page/splash_page.dart';

main() {
  runApp(
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc()..add(AppStarted()),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return NavPage();
          }

          if (state is AuthUnauthenticated) {
            return Login();
          }

          return Splash();
        },
      ),
    );
  }
}
