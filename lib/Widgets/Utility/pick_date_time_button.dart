import 'package:flutter/material.dart';
import 'package:plume/Utilities/function_library.dart';

class PickDateTimeButton extends StatelessWidget {
  const PickDateTimeButton({
    Key key, this.onDateChange, this.onTimeChange, this.buttonText,
  }) : super(key: key);
  final Function onDateChange;
  final Function onTimeChange;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap:() => FunctionLibrary.pickTime(context, onDateChange, onTimeChange),
      child: Container(
        height: 60.0,
        width: size.width * 0.3,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
                fontSize: 22,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}

