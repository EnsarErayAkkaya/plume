import 'package:flutter/material.dart';
import 'package:plume/Pages/TeacherPages/teacher_dashboard_page.dart';
import 'package:plume/Services/login.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Pages/AuthorizationPages/choose_role_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {

  runApp(MaterialApp(
    title: 'Plume',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.brown[600],
      accentColor: Colors.blue,
      scaffoldBackgroundColor: Colors.amber[100]
    ),
    routes: {
      '/': (context) => ChooseRolePage()
    },
  ));
}