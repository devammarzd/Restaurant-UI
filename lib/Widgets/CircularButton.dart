import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {Key key,
      @required this.icon,
      @required this.onPressed,
      this.bgColor = Colors.white})
      : super(key: key);

  final Widget icon;
  final void Function() onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: new CircleBorder(),
      elevation: 4.0,
      fillColor: bgColor,
      padding: const EdgeInsets.all(4.0),
      onPressed: onPressed,
      child: CircleAvatar(
        child: icon,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
