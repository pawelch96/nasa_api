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
          bottom: 64,
          left: 0.0,
          right: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: _buildColumn(context: context),
          ),
        ),
        Positioned(
          bottom: 24,
          left: 0.0,
          right: 16.0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              icon: Icon(
                Icons.expand_less,
                color: Colors.white,
                size: 48.0,
              ),
              onPressed: () => _onIconPressed(context: context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColumn({BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTitle(context: context),
        SizedBox(
          height: 8,
        ),
        if (result.copyright != null) _buildAuthorText(context: context),
      ],
    );
  }

  Widget _buildTitle({BuildContext context}) {
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

  void _onIconPressed({BuildContext context}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.7),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(15),
                  topRight: const Radius.circular(15),
                )),
            child: _buildBottomDescription(context: context),
          ),
        );
      },
    );
  }

  Widget _buildBottomDescription({BuildContext context}) {
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
                  result.explanation,
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
