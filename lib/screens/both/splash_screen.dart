import 'package:edulb/application/auth/auth_bloc.dart';

import 'package:edulb/screens/both/auth_screen.dart';
import 'package:edulb/screens/both/grades_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (_, state) {
        state.map(
          initial: (_) {},
          unAuthenticated: (_) =>
              Navigator.of(context).pushReplacementNamed(AuthScreen.routeName),
          authenticated: (_) =>
              Navigator.of(context).pushReplacementNamed(Home.routeName),
        );
      },
      child: Scaffold(
        body: Center(
          child: Text('Loading...'),
        ),
      ),
    );
  }
}
