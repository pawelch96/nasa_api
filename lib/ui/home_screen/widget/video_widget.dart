import 'package:flutter/material.dart';
import 'package:nasa_api/data/model/picture_of_the_day_response.dart';
import 'package:nasa_api/ui/home_screen/widget/bottom_icon_widget.dart';
import 'package:nasa_api/ui/home_screen/widget/common_widgets.dart';
import 'package:nasa_api/ui/home_screen/widget/web_view_widget.dart';

class VideoWidget extends StatelessWidget {
  final PictureOfTheDayResponse result;

  VideoWidget({Key key, @required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/splash_screen.png",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        GradientWidget(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.play_circle_filled),
                color: Colors.lightBlueAccent,
                iconSize: 86.0,
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) =>
                          WebViewWidget(url: result.url),
                    ),
                  );
                },
              ),
              Text(
                "Watch video content",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 64,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: TitleTextWidget(result: result, context: context),
          ),
        ),
        BottomIconWidget(
          description: result.explanation,
        ),
      ],
    );
  }
}
