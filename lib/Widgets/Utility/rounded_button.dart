import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final color, textColor;

  RoundedButton({
    this.text,
    this.press,
    this.color,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => press(),
      child: Container(
        height: 60.0,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(29.0)
        ),
        child: Center(
          child: Text(
            '$text',
            style: TextStyle(
                color: textColor,
                fontSize: 25.0
            ),
          ),
        ),
      ),
    );
  }
}
