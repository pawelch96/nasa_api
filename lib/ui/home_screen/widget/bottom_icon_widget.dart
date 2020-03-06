import 'package:flutter/material.dart';
import 'package:nasa_api/ui/home_screen/widget/common_widgets.dart';

class BottomIconWidget extends StatelessWidget {
  final String description;
  const BottomIconWidget({Key key, @required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
            child: BottomDescriptionWidget(
                description: description, context: context),
          ),
        );
      },
    );
  }
}
