import 'package:flutter/material.dart';
import 'package:plume/Utilities/function_library.dart';

class PickFileButton extends StatelessWidget {
  final Function onConfirm;

  const PickFileButton({Key key, this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap:() => FunctionLibrary.pickFile(context, onConfirm),
      child: Container(
        height: 60.0,
        width: size.width * 0.3,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            'Select File',
            style: TextStyle(
                fontSize: 25,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}