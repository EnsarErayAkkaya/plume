import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plume/Pages/StudentPages/student_dashboard_page.dart';
import 'package:plume/Pages/TeacherPages/teacher_dashboard_page.dart';
import 'package:plume/Services/login.dart';
import 'package:plume/Widgets/Utility/rounded_button.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Pages/AuthorizationPages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseRolePage extends StatelessWidget {
  Stream<String> _autoLogin = (() async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool login = prefs.getBool('login');
    String userRole;
    Map loginResponse;
    if(login != null && login == true) {
      String email = prefs.getString('email');
      String password = prefs.getString('pass');
      userRole = prefs.getString('role');

      Login _login = Login(email, password, userRole);
      loginResponse = await _login.sendLoginRequest();
      if(loginResponse['success'] == true){
        yield json.encode(loginResponse);
      }
      else{
        yield json.encode({'success':'false'});
      }
    }
    else{
      yield json.encode({'success':'false'});
    }
  })();
  void _onLogin(BuildContext context, Map response) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _userRole = prefs.getString('role');
    await Future<void>.delayed(Duration(seconds: 1));
    if(_userRole == 'teacher'){
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context){
              return TeacherDashboardPage(response['data']);
            }
        ),
      );
    }
    else{
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context){
              return StudentDashboardPage(response['data']);
            }
        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<String>(
        stream: _autoLogin,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot){
          Widget child;
          if (snapshot.hasError) {
            child = Column(
              children:<Widget>[
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
                /*Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('Stack trace: ${snapshot.stackTrace}'),
                ),*/
              ]
            );
          }else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                child = SizedBox(
                  child: const CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                );
                break;
              case ConnectionState.waiting:
                child = SizedBox(
                    child: const CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  );
                break;
              case ConnectionState.active:
                child = Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 60,
                  );

                Map response = json.decode(snapshot.data);
                print('response: '+response['success'].toString());

                if(response['success'] == true) {
                  _onLogin(context, response);
                }
                else{
                  child:Scaffold(
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
                break;
              case ConnectionState.done:
                child:Scaffold(
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

                Map response = json.decode(snapshot.data);
                print('response: '+response['success'].toString());

                if(response['success'] == true){
                  _onLogin(context, response);
                }
                break;
            }
          }

          return  child != null? Container(
                child:Center(child:child)):
          Scaffold(
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
    );
  }
}