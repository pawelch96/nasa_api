import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen_bloc.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen_state.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime initialDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context, SplashScreenBloc bloc) async {
    final datePicked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.utc(1995, DateTime.june, 16),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData(
            primaryColor: Colors.black,
            dialogBackgroundColor: Colors.black,
            accentColor: Colors.lightBlueAccent,
            textTheme: TextTheme(
              body1: TextStyle(
                color: Colors.white,
              ),
              subhead: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          child: child,
        );
      },
    );
    if (datePicked != null && datePicked != initialDate) {
      // setState(() {
      //   initialDate = datePicked;
      // });
      bloc.onSplashScreenInitiated("${datePicked.toLocal()}".split(' ')[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _splashBloc = BlocProvider.of<SplashScreenBloc>(context);
    return BlocBuilder(
      bloc: _splashBloc,
      builder: (context, SplashScreenState state) {
        if (state.isFailure) {
          return SnackBar(
            backgroundColor: Colors.grey[800],
            content: Text(state.error),
          );
        } else {
          return SafeArea(
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                title: Text("Astronomy POD"),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    tooltip: 'Change date',
                    onPressed: () {
                      _selectDate(context, _splashBloc);
                    },
                  )
                ],
              ),
              body: Stack(
                children: <Widget>[
                  Center(
                    child: SpinKitChasingDots(
                      color: Colors.lightBlueAccent,
                      size: 86.0,
                    ),
                  ),
                  Center(
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: state.result.url,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),
                  Positioned(
                    bottom: 48,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            state.result.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                            maxLines: 1,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Author: " + state.result.copyright,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Icon(
                        Icons.expand_less,
                        color: Colors.white,
                        size: 48.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
