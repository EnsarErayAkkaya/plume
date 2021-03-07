import 'package:flutter/material.dart';

class LoadInducator extends StatelessWidget {
  const LoadInducator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.grey,
      valueColor: new AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
      strokeWidth: 8,
    );
  }
}