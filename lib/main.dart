import 'package:flutter/material.dart';
import 'package:plume/Pages/TeacherPages/teacher_dashboard_page.dart';
import 'package:plume/Services/login.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Pages/AuthorizationPages/choose_role_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  /*SharedPreferences prefs = await SharedPreferences.getInstance();
  bool login = prefs.getBool('login');
  String userRole;
  Map loginResponse;
  if(login) {
    String email = prefs.getString('email');
    String password = prefs.getString('pass');
    userRole = prefs.getString('role');

    Login _login = Login(email, password, userRole);
    loginResponse = await _login.sendLoginRequest();
  }*/

  runApp(MaterialApp(
    title: 'Plume',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.brown[600],
      accentColor: Colors.blue,
      scaffoldBackgroundColor: Colors.grey[50]
    ),
    routes: {
      '/': (context) => /*((loginResponse != null && loginResponse['success'] == true)?
        TeacherDashboardPage(loginResponse['data'], userRole):*/ChooseRolePage()
    },
  ));
}