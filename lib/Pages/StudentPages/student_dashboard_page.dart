import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/Data/student_data.dart';
import 'package:plume/Models/connection.dart';
import 'package:plume/Models/student.dart';
import 'package:plume/Pages/StudentPages/connections_page.dart';
import 'package:plume/Pages/StudentPages/profile_page.dart';
import 'package:plume/Pages/StudentPages/subjects_page.dart';
import 'package:plume/Services/fetch_student_connections.dart';
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
    if(index == 0 ){
      //fetch subjects
    }
    else if(index == 1 ){
      //fetch connections
      fetchConnections();
    }
    else{
      //nothing
    }
  }

  void fetchConnections() async {
    print('fetch Connections');
    FetchStudentConnections _fetch = FetchStudentConnections(StudentData.student.id);
    Map response = await _fetch.sendFetchConnections();
    if(response['success'] == true){
      Iterable teachersList = response['data'];
      List<Connection> teachers = teachersList.map((i) =>
          Connection.fromJson(i)).toList();
      StudentData.student.teachers = teachers;
    }
    else{
      print(response['error']);
    }
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
        connections: 'Teachers',
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


