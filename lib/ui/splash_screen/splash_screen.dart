import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
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
  final _splashBloc = kiwi.Container().resolve<SplashScreenBloc>();

  @override
  void initState() {
    super.initState();

    _splashBloc.onSplashScreenInitiated('');
    // loadData();
  }

  // void loadData() async {
  //   _splashBloc.onSplashScreenInitiated('');

  //   if (_splashBloc.currentState.isSuccessful) {
  //     Timer(
  //       Duration(milliseconds: 3000),
  //       () => Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (BuildContext context) => HomeScreen(),
  //         ),
  //       ),
  //     );
  //   }
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _splashBloc.dispose(); //TODO: check if it doesn't erase state data
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: _splashBloc,
        child: BlocBuilder(
          bloc: _splashBloc,
          builder: (context, SplashScreenState state) {
            if (state.isInitial || state.isLoading) {
              return _buildScaffold();
            } else if (state.isSuccessful) {
              Timer(
                Duration(milliseconds: 2500),
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
        ));
  }

  Scaffold _buildScaffold() {
    // return BlocListener<BuildContext, SplashScreenState>(
    //     bloc: _splashBloc,
    //     listener: (context, state) {
    //       if (state.isSuccessful) {
    //         Timer(
    //             Duration(milliseconds: 500),
    //             () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //                 builder: (BuildContext context) => HomeScreen())));
    //       }
    //     }, child: Scaffold(
    //   body: Stack(
    //     fit: StackFit.expand,
    //     children: <Widget>[
    //       Image.asset(
    //         'images/splash.jpg',
    //         fit: BoxFit.cover,
    //       ),
    //       Container(
    //         alignment: Alignment.bottomCenter,
    //         decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //             begin: Alignment.bottomCenter,
    //             end: Alignment.topCenter,
    //             stops: [0.15, 0.5],
    //             colors: [
    //               Colors.black.withOpacity(0.9),
    //               Colors.transparent,
    //             ],
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         bottom: 72,
    //         left: (MediaQuery.of(context).size.width / 2) - 43,
    //         child: SpinKitChasingDots(
    //           color: Colors.lightBlueAccent,
    //           size: 86.0,
    //         ),
    //       ),
    //     ],
    //   ),

    // )
    //   );
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'images/splash.jpg',
            fit: BoxFit.cover,
          ),
          Container(
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
          ),
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
}
