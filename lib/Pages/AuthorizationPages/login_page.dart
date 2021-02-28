import 'package:flutter/material.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Pages/AuthorizationPages/sign_up_page.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Pages/TeacherPages/teacher_dashboard_page.dart';
import 'package:plume/Services/login.dart';
import 'package:plume/Widgets/Utility/rounded_button.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/Utility/rounded_input_field.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/Utility/rounded_password_field.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/Utility/already_have_an_account_check.dart';

class LoginPage extends StatefulWidget {
  final String userRole;

  const LoginPage({Key key, this.userRole}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String password;
  String errorText = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.05,),
          Text(
              'Login As',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              )
          ),
          Text(
            widget.userRole[0].toUpperCase() + widget.userRole.substring(1), // get role for title
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
            ),
          ),
          SizedBox(height: size.height * 0.05,),
          RoundedInputField(
            hintText: 'Your Email',
            icon: Icons.person,
            onChanged: (value){email = value;},
          ),
          RoundedPasswordField(
            onChanged: (value){password = value;} ,
          ),
          SizedBox(height: size.height * 0.02,),
          Text(
            errorText,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.red[700],
            ),
          ),
          SizedBox(height: size.height * 0.02,),
          RoundedButton(
            text: 'Login',
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            //Login on press
            press: () async {
              Login login = Login(email, password, widget.userRole);
              Map loginResponse = await login.sendLoginRequest();
              if(loginResponse['success'] == true){
                setState(() {
                  errorText = '';
                  // go to main page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        return TeacherDashboardPage(loginResponse['data'], widget.userRole);
                      }
                    ),
                  );
                });
              }
              else{
                setState(() {
                  errorText = loginResponse['error'];
                });
              }
            },
          ),
          SizedBox(height: size.height * 0.03,),
          AlreadyHaveAnAccountCheck(
            press: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context){
                      return SignUpPage(userRole: widget.userRole,);
                    },
                ),
              );
            },
          ),
        ]
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}






