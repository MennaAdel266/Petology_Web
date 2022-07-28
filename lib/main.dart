import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petology/Modules/Login/login_screen.dart';
import 'package:petology/Modules/Signup/signup_screen.dart';
import 'package:petology/Shared/Network/local/cache_helper.dart';
import 'package:petology/Shared/Network/remote/dio_helper.dart';
import 'package:petology/Shared/bloc_observer.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   inputDecorationTheme: InputDecorationTheme(
      //     fillColor: Colors.white,
      //     filled: true,
      //     enabledBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(35),
      //       borderSide: BorderSide(
      //         color: Colors.grey[200],
      //       ),
      //
      //     ),
      //   ),
      // ),
      home: SignUpScreen(),
    );
  }
}

