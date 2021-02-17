import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/student.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/Utility/search_bar_template.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/StudentWidgets/student_list_view.dart';

class StudentsPage extends StatefulWidget {
 // GetStudents _getStudents;
  List<Student> students;

  StudentsPage({Key key}) :super(key: key) {
    students = TeacherData.teacher.students;
    //print(students[0].name);
  }

    @override
    _StudentsPageState createState() => _StudentsPageState();
  }

class _StudentsPageState extends State<StudentsPage>
  with AutomaticKeepAliveClientMixin{
  String searchText = '';

  Widget bodyItem;

  void setBodyItem(String value, List<Student> s)
  {
    setState(() {
      searchText = value;
      bodyItem = searchText == ''? StudentsListView(
        students: s,
        onPress: (){},
        buttonIcon: Icons.cancel,
        buttonText: 'Delete Connection',
      ) : Center(child: Text('Searching'));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    super.build(context);
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:Container(
        margin: EdgeInsets.fromLTRB(0,size.height * .025,0,0),
        child: Column(
          children: [
            SearchBarTemplate(
              setBodyItem:(value) => setBodyItem(value, widget.students),
            ),
            Expanded(
                child: bodyItem == null? StudentsListView(
                  students: widget.students,
                  onPress: (){},
                  buttonIcon: Icons.cancel,
                  buttonText: 'Delete Connection',
                ): bodyItem
            )
          ],
        ),
      )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

