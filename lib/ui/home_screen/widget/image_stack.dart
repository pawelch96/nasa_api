import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nasa_api/data/model/picture_of_the_day_response.dart';
import 'package:nasa_api/ui/home_screen/widget/bottom_icon_widget.dart';
import 'package:nasa_api/ui/home_screen/widget/common_widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageStack extends StatelessWidget {
  final PictureOfTheDayResponse result;
  const ImageStack({Key key, @required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: SpinKitChasingDots(
            color: Colors.lightBlueAccent,
            size: 86.0,
          ),
        ),
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: result.url,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
        Positioned(
          bottom: 64,
          left: 0.0,
          right: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: _buildColumn(context: context),
          ),
        ),
        BottomIconWidget(
          description: result.explanation,
        ),
      ],
    );
  }

  Widget _buildColumn({BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleTextWidget(result: result, context: context),
        SizedBox(
          height: 8,
        ),
        if (result.copyright != null) _buildAuthorText(context: context),
      ],
    );
  }

  Widget _buildAuthorText({BuildContext context}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 8,
      child: Text(
        "Author: " + result.copyright,
        softWrap: true,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
