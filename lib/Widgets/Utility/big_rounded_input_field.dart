import 'package:flutter/material.dart';
import 'package:plume/Widgets/Utility/big_text_field_container.dart';

class BigRoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const BigRoundedInputField({
    Key key, this.hintText, this.icon, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BigTextFieldContainer(
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          hintText: hintText,
          hintMaxLines: 6,
          border: InputBorder.none,
        ),
        style:TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}