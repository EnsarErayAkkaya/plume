import 'package:flutter/material.dart';

class FloatingButtonTemplate extends StatelessWidget {
  final IconData icon;
  final Function press;
  final Color color;

  const FloatingButtonTemplate({Key key, this.icon, this.press, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //materialTapTargetSize: MaterialTapTargetSize.padded,
      onPressed: press,
      child: Icon(
        icon,
        size: 35,
      ),
      backgroundColor: color,
    );
  }
}
