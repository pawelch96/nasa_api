import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:nasa_api/ui/splash_screen/splash_screen_bloc.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen_state.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _splashBloc = kiwi.Container().resolve<SplashScreenBloc>();

  @override
  void dispose() {
    super.dispose();
    _splashBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
