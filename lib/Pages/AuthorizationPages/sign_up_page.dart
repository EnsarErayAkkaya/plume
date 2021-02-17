import 'package:flutter/material.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Pages/AuthorizationPages/login_page.dart';
import 'package:plume/Services/sign_up.dart';
import 'package:plume/Widgets/Utility/rounded_button.dart';
import 'package:plume/Widgets/already_have_an_account_check.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/Utility/rounded_input_field.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/Utility/rounded_password_field.dart';

class SignUpPage extends StatefulWidget {
  final String userRole;

  const SignUpPage({Key key, this.userRole}) : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String name;
  String surname;
  String email;
  String password;
  String errorText = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
                'SignUp As '+ widget.userRole[0].toUpperCase() + widget.userRole.substring(1),
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                )
            ),
            SizedBox(height: size.height * 0.03,),
            RoundedInputField(
              hintText: 'Your Name',
              icon: Icons.perm_contact_cal,
              onChanged: (value){ name = value;},
            ),
            RoundedInputField(
              hintText: 'Your Surname',
              icon: Icons.perm_contact_cal,
              onChanged: (value){surname = value;},
            ),
            RoundedInputField(
              hintText: 'Your Email',
              icon: Icons.mail,
              onChanged: (value){email = value;},
            ),
            RoundedPasswordField(
              onChanged: (value){password = value;},
            ),
            Text(
              errorText,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.red[700],
              ),
            ),
            //SizedBox(height: size.height * 0.05,),
            RoundedButton(
              text: 'SIGN UP',
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              press: () async{
                SignUp signUp = SignUp(name, surname, email, password, widget.userRole);
                Map registerResponse = await signUp.sendRegisterRequest();
                if(registerResponse['success'] == true){
                  setState(() {
                    errorText = 'Successful. You can login.';
                  });
                }
                else{
                  setState(() {
                    errorText = registerResponse['error'];
                  });
                }
              },
            ),
            SizedBox(height: size.height * 0.03,),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context){
                          return LoginPage(userRole: widget.userRole,);
                        }
                    )
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
