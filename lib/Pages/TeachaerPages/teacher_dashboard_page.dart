import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/teacher.dart';
import 'package:plume/Pages/TeachaerPages/profile_page.dart';
import 'package:plume/Pages/TeachaerPages/students_page.dart';
import 'package:plume/Pages/TeachaerPages/subjects_page.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/Utility/bottom_navigation_bar_template.dart';

// ignore: must_be_immutable
class TeacherDashboardPage extends StatefulWidget {
  final String userRole;
  List<Widget> _pages;
  TeacherDashboardPage(Map userData, this.userRole) {
    TeacherData.teacher = Teacher.fromJson(userData);
    _pages = [
      SubjectsPage(),
      StudentsPage(),
      ProfilePage()
    ];
  }

  @override
  _TeacherDashboardPageState createState() => _TeacherDashboardPageState();
}

class _TeacherDashboardPageState extends State<TeacherDashboardPage> {
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
        press: (int index,){
          _pageController.jumpToPage(index);
        },
        primaryColor: Theme.of(context).primaryColor,
        accentColor: Theme.of(context).accentColor,
      ),
    );
  }
}


