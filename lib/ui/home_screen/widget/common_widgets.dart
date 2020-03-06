import 'package:flutter/material.dart';
import 'package:nasa_api/data/model/picture_of_the_day_response.dart';

class BottomDescriptionWidget extends StatelessWidget {
  const BottomDescriptionWidget({
    Key key,
    @required this.description,
    @required this.context,
  }) : super(key: key);

  final String description;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SizedBox.expand(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: RaisedButton(
                    color: Colors.transparent,
                    child: Icon(
                      Icons.expand_more,
                      color: Colors.white,
                      size: 48.0,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                child: Text(
                  description,
                  softWrap: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    Key key,
    @required this.result,
    @required this.context,
  }) : super(key: key);

  final PictureOfTheDayResponse result;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 8,
      child: Text(
        result.title,
        softWrap: true,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}

class GradientWidget extends StatelessWidget {
  const GradientWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
