import 'package:flutter/material.dart';
import 'package:nasa_api/data/model/picture_of_the_day_response.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

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
        _buildGradient(),
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
            child: _buildTitle(context: context),
          ),
        ),
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

class WebViewWidget extends StatelessWidget {
  final String url;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewWidget({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: RaisedButton(
                    color: Colors.transparent,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: SizedBox.expand(
              child: WebView(
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
