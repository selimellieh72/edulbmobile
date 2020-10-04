import 'package:edulb/application/app_drawer/app_drawer_bloc.dart';
import 'package:edulb/application/auth/auth_bloc.dart';

import 'package:edulb/domain/app_info.dart';

import 'package:edulb/injectable.dart';
import 'package:edulb/screens/both/auth_screen.dart';
import 'package:edulb/screens/both/grades_screen.dart';
import 'package:edulb/screens/both/home.dart';
import 'package:edulb/screens/both/homework_screen.dart';
import 'package:edulb/screens/both/splash_screen.dart';
import 'package:edulb/screens/both/tab_screen.dart';
import 'package:edulb/screens/teachers/requests.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt.get<AuthBloc>()..add(AuthEvent.checkAuthStatus()),
        ),
        BlocProvider(
          create: (_) => AppDrawerBloc(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppInfo(),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'EduLB',
            theme: ThemeData(
              primaryColor: Color.fromRGBO(42, 42, 42, 1),
              accentColor: Color.fromRGBO(112, 112, 112, 1),
              fontFamily: 'Poppins',
              buttonTheme: ThemeData.light().buttonTheme.copyWith(
                    buttonColor: Colors.blue[800],
                    textTheme: ButtonTextTheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
              textTheme: ThemeData.light().textTheme.copyWith(
                    headline6: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                    subtitle2: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    bodyText1: TextStyle(fontSize: 15, color: Colors.white),
                  ),
            ),
            routes: {
              GradesScreen.routeName: (_) => GradesScreen(),
              TabsScreen.routeName: (_) => TabsScreen(),
              RequestsScreen.routeName: (_) => RequestsScreen(),
              AuthScreen.routeName: (_) => AuthScreen(),
              Home.routeName: (_) => Home(),
              HomeworkScreen.routeName: (_) => HomeworkScreen(),
            },
            home: SplashScreen()),
      ),
    );
  }
}
