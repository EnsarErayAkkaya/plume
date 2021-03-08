import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/student.dart';
import 'package:plume/Models/subject.dart';
import 'package:plume/Models/teacher.dart';
import 'package:plume/Pages/TeacherPages/profile_page.dart';
import 'package:plume/Pages/TeacherPages/students_page.dart';
import 'package:plume/Pages/TeacherPages/subjects_page.dart';
import 'package:plume/Services/fetch_teacher_subjects.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/Utility/bottom_navigation_bar_template.dart';
import 'package:plume/Services/get_students.dart';

// ignore: must_be_immutable
class TeacherDashboardPage extends StatefulWidget {
  List<Widget> _pages;
  TeacherDashboardPage(Map userData) {
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
    if(index == 0 ){
      //fetch subjects
      fetchSubjects();
    }
    else if(index == 1 ){
      //fetch connections
      fetchStudents();
    }
    else{
      //nothing
    }
  }
  void fetchStudents() async{
    print('fetch Connections');
    GetStudents _fetch = GetStudents(TeacherData.teacher.id);
    Map response = await _fetch.sendGetStudents();
    if(response['success'] == true){
      Iterable studentList = response['data'];

      List<Student> students = studentList.map((i) =>
          Student.fromJsonSimple(i)).toList();
      TeacherData.teacher.students = students;
      setState(() {});
    }
    else{
      print(response['error']);
    }
  }
  void fetchSubjects() async{
    print('fetch Connections');
    FetchTeacherSubjects _fetch = FetchTeacherSubjects(TeacherData.teacher.id);
    Map response = await _fetch.sendFetchSubjects();
    if(response['success'] == true){
      Iterable subjectList = response['data'];

      List<Subject> subjects = subjectList.map((i) =>
          Subject.fromJson(i)).toList();
      TeacherData.teacher.subjects = subjects;
      setState(() {});
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
        connections: 'Students',
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


