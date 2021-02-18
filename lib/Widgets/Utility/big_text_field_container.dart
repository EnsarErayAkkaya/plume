import 'package:flutter/material.dart';

class BigTextFieldContainer extends StatelessWidget {
  final Widget child;
  const BigTextFieldContainer({
    Key key, this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      height: size.height* 0.3,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(29)
      ),
      child: child,
    );
  }
}