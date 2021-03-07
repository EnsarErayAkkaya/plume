import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/student.dart';
import 'package:plume/Services/create_connection.dart';
import 'package:plume/Services/delete_connection.dart';
import 'package:plume/Services/remove_student.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/Utility/search_bar_template.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/StudentWidgets/student_list_view.dart';
import 'package:plume/Services/search_students.dart';

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
  Future<void> searchStudents() async{
    SearchStudents _searchStudents = SearchStudents(searchString: searchText);
    Map searchResponse = await _searchStudents.sendSearchStudents();
    if(searchResponse['success'] == true){
      print('search success');
      Iterable studentIterable = searchResponse['data'];

      print('students page ' + searchResponse['data'].toString());

      List<Student> students = studentIterable.map((i) =>
          Student.fromJsonSimple(i)).toList();

      students.removeWhere((s) => TeacherData.teacher.students.any((element) => element.id == s.id));

      setState(() {
        searchResult = StudentsListView(
          students: students,
          onPress: (String studentId) async{
            CreateConnection _createConnection = CreateConnection(student: studentId, teacher: TeacherData.teacher.id);
            Map _connectionResponse = await _createConnection.sendCreateConnectionRequest();
            if(_connectionResponse['success'] == true){
              print('connection request send');
            }else{
              print('connection request error:' + _connectionResponse['error']);
            }
          },
          buttonIcon: Icons.add,
          buttonText: 'Create Connection',
          color: Colors.green,
          buttonColor: Colors.blue,
        );
      });
    }
    else{
      setState(() {
        searchResult = Center(
          child: Text(
            'Couldn\'t Search',
          ),
        );
      });
    }
  }

  Widget bodyItem;

  Widget searchResult = Center(
    child: Text(
      'Wait for Dear Students...',
    ),
  );
  void removeDeletedStudent(String studentId, String subjectId) async{
    RemoveStudent _removeStudent = RemoveStudent(TeacherData.teacher.id,subjectId,studentId,);
    Map removeResponse = await _removeStudent.sendAddStudentRequest();
    if(removeResponse['success'] == true){
      print('removed');
      //remove student
      TeacherData.teacher.subjects.firstWhere(
              (s) => s.id == subjectId
      ).students.removeWhere((s) => s == studentId);
    }
    else{
      print('error');
    }
  }
  void deleteConnection (String studentId) async{
    DeleteConnection _deleteConnection = DeleteConnection(studentId, TeacherData.teacher.id);
    Map _deleteResponse = await _deleteConnection.sendDeleteConnectionRequest();
    if(_deleteResponse['success'] == true){
      print('student connection deleted');
      setState((){
        var subjects = TeacherData.teacher.subjects.where((s) => s.students.any((e) => e == studentId)).toList();
        for(int i = 0; i < subjects.length; i++){
          removeDeletedStudent(studentId, subjects[i].id);
        }
        TeacherData.teacher.students.removeWhere((s) => s.id == studentId);
      });
    }else{
      print('Delete connection error: ' + _deleteResponse['error']);
    }
  }

  void setBodyItem(String value, List<Student> s, BuildContext context) async {
    searchText = value;
    if(searchText != '')
      searchStudents();

    setState(() {
      bodyItem = searchText == ''? StudentsListView(
        students: s,
        onPress: deleteConnection,
        buttonIcon: Icons.cancel,
        buttonText: 'Delete Connection',
        color: Theme.of(context).accentColor,
      ) : searchResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    super.build(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:Container(
        height: size.height,
        width: size.width,
        margin: EdgeInsets.fromLTRB(0,size.height * .025,0,0),
        child: Column(
          children: [
            SearchBarTemplate(
              setBodyItem:(value) => setBodyItem(value, widget.students, context),
            ),
            Expanded(
              child:bodyItem == null? StudentsListView(
                students: widget.students,
                onPress: deleteConnection,
                buttonIcon: Icons.cancel,
                buttonText: 'Delete Connection',
                color: Theme.of(context).accentColor,
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

