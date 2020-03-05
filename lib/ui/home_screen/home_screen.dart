import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nasa_api/data/model/picture_of_the_day_response.dart';
import 'package:nasa_api/ui/home_screen/widget/image_stack.dart';
import 'package:nasa_api/ui/home_screen/widget/video_widget.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen_bloc.dart';
import 'package:nasa_api/ui/splash_screen/splash_screen_state.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime initialDate = DateTime.now();
  SplashScreenBloc _splashBloc;

  @override
  void initState() {
    super.initState();
    _splashBloc = BlocProvider.of<SplashScreenBloc>(context);
  }

  Future<Null> _selectDate(BuildContext context) async {
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
      setState(() {
        initialDate = datePicked;
      });
      _splashBloc
          .onSplashScreenInitiated("${datePicked.toLocal()}".split(' ')[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _splashBloc,
      builder: (context, SplashScreenState state) {
        if (state.isFailure) {
          return SnackBar(
            backgroundColor: Colors.grey[800],
            content: Text(state.error),
          );
        } else if (state.isSuccessful) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.black,
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
                      _selectDate(context);
                    },
                  )
                ],
              ),
              body: _buildBody(state.result),
            ),
          );
        } else {
          return _buildLoading();
        }
      },
    );
  }

  Widget _buildBody(PictureOfTheDayResponse result) {
    if (result.media_type == "video")
      return VideoWidget(result: result);
    else
      return ImageStack(result: result);
  }

  Center _buildLoading() {
    return Center(
      child: SpinKitChasingDots(
        color: Colors.lightBlueAccent,
        size: 86.0,
      ),
    );
  }
}
