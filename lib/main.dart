import 'package:flutter/material.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Pages/AuthorizationPages/choose_role_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Plume',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.brown[600],
      accentColor: Colors.blue,
      scaffoldBackgroundColor: Colors.grey[50]
    ),
    routes: {
      '/': (context) => ChooseRolePage()
    },
  ));
}

