import 'package:flutter/material.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/Utility/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          onChanged: onChanged,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: Colors.white,
            ),
            border: InputBorder.none,
          ),
          style:TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        )
    );
  }
}