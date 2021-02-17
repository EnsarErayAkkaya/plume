import 'package:flutter/material.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/Utility/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key, this.hintText, this.icon, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          hintText: hintText,

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