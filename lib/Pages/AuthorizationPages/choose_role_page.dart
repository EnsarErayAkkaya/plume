import 'package:flutter/material.dart';
import 'package:plume/Widgets/Utility/rounded_button.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Pages/AuthorizationPages/login_page.dart';

class ChooseRolePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                    'Plume',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  )
              ),
              SizedBox(height: size.height * 0.05,),
              Text(
                'Are you?',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).accentColor,
                ),
              ),
              SizedBox(height: size.height * 0.035,),
              RoundedButton(text: 'Teacher',
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                press: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => LoginPage(
                            userRole: 'teacher',
                          )
                      )
                  );},
              ),
              SizedBox(height: size.height * 0.01,),
              Text(
                'or',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).accentColor,
                  fontWeight:  FontWeight.w400,
                ),
              ),
              SizedBox(height: size.height * 0.01,),
              RoundedButton(text: 'Student',
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => LoginPage(
                            userRole: 'student',
                          )
                      )
                  );},
              )
            ],
          ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}