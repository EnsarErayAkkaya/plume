import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final Function press;
  final bool login;
  const AlreadyHaveAnAccountCheck({
    Key key, this.press, this.login = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ?'Don\'t have an account?': 'Already have an account?',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ?'  Sign Up' : '  Sign In',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}