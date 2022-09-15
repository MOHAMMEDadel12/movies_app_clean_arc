import 'package:flutter/material.dart';
import 'package:movies_app_clean_arc/core/services/services_locator.dart';
import 'package:movies_app_clean_arc/tvs/prsentaion/screens/movies_screen.dart';

void main() {
  ServicesLocator().init() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MainMoviesScreen()
    );
  }
}


