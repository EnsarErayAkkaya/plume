import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/Data/student_data.dart';
import 'package:plume/Models/student.dart';
import 'package:plume/Pages/StudentPages/connections_page.dart';
import 'package:plume/Pages/StudentPages/profile_page.dart';
import 'package:plume/Pages/StudentPages/subjects_page.dart';
import 'package:plume/Widgets/Utility/bottom_navigation_bar_template.dart';

// ignore: must_be_immutable
class StudentDashboardPage extends StatefulWidget {
  List<Widget> _pages;
  StudentDashboardPage(Map userData) {
    StudentData.student = Student.fromJson(userData);
    _pages = [
      SubjectsPage(),
      ConnectionsPage(),
      ProfilePage()
    ];
  }

  @override
  _StudentDashboardPageState createState() => _StudentDashboardPageState();
}

class _StudentDashboardPageState extends State<StudentDashboardPage> {
  PageController _pageController = PageController();

  void _onPageChanged(int index){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: widget._pages,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBarTemplate(
        home: 'Subjects',
        connections: 'Connections',
        profile: 'Profile',
        press: (int index,){
          _pageController.jumpToPage(index);
        },
        primaryColor: Theme.of(context).primaryColor,
        accentColor: Theme.of(context).accentColor,
      ),
    );
  }
}


