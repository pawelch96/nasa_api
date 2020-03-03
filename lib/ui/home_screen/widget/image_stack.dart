import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nasa_api/data/model/picture_of_the_day_response.dart';
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
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: result.url,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Positioned(
          bottom: 48,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: _buildColumn(),
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
    );
  }

  Widget _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitle(),
        SizedBox(
          height: 8,
        ),
        if (result.copyright != null) _buildAuthorText(),
      ],
    );
  }

  Text _buildTitle() {
    return Text(
      result.title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      maxLines: 1,
    );
  }

  Text _buildAuthorText() {
    return Text(
      "Author: " + result.copyright,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
