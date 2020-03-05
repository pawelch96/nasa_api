import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nasa_api/ui/home_screen/home_screen.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen_bloc.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen_state.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenBloc _splashBloc;

  @override
  void initState() {
    super.initState();
    _splashBloc = BlocProvider.of<SplashScreenBloc>(context);
    _splashBloc.onSplashScreenInitiated('');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _splashBloc,
      builder: (context, SplashScreenState state) {
        if (state.isInitial || state.isLoading) {
          return _buildScaffold();
        } else if (state.isSuccessful) {
          Timer(
            Duration(milliseconds: 5000),
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => HomeScreen(),
              ),
            ),
          );
          return Scaffold();
        } else {
          return SnackBar(
            backgroundColor: Colors.grey[800],
            content: Text(state.error),
          );
        }
      },
    );
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'images/splash_screen.png',
            fit: BoxFit.cover,
          ),
          _buildGradient(),
          Positioned(
            bottom: 72,
            left: (MediaQuery.of(context).size.width / 2) - 43,
            child: SpinKitChasingDots(
              color: Colors.lightBlueAccent,
              size: 86.0,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildGradient() {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.15, 0.5],
          colors: [
            Colors.black.withOpacity(0.9),
            Colors.transparent,
          ],
        ),
      ),
    );
  }
}
