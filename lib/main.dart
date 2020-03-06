import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:nasa_api/injection_container.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen_bloc.dart';

void main() {
  initKiwi();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final splashBloc = kiwi.Container().resolve<SplashScreenBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashScreenBloc>(
      bloc: splashBloc,
      child: MaterialApp(
          title: "Astronomy Picture of the Day",
          theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.indigo,
            accentColor: Colors.blueAccent[400],
          ),
          home: SplashScreen()),
    );
  }
}
