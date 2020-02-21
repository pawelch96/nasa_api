import 'package:flutter/material.dart';
import 'package:nasa_api/injection_container.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen.dart';

void main() {
  initKiwi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Astronomy Picture of the Day",
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.indigo,
          accentColor: Colors.blueAccent[400],
        ),
        home: SplashScreen());
  }
}
