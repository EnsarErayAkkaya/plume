import 'package:flutter/material.dart';
import 'package:plume/Data/student_data.dart';
import 'package:plume/Models/connection.dart';
import 'package:plume/Models/student.dart';
import 'package:plume/Models/subject.dart';
import 'package:plume/Services/answer_connection_request.dart';
import 'package:plume/Services/delete_connection.dart';
import 'package:plume/Services/fetch_student_connections.dart';
import 'package:plume/Services/leave_subject.dart';
import 'package:plume/Widgets/StudentWidgets/accepted_connections_card.dart';
import 'package:plume/Widgets/StudentWidgets/waiting_connections_card.dart';
import 'package:plume/Widgets/Utility/floating_button_template.dart';

class ConnectionsPage extends StatefulWidget {
  @override
  _ConnectionsPageState createState() => _ConnectionsPageState();

}

class _ConnectionsPageState extends State<ConnectionsPage>
    with AutomaticKeepAliveClientMixin{
  Widget body;

  IconData floatingButtonIcon = Icons.person_add_alt_1_outlined;
  Color floatingButtonColor = Colors.green;

  bool isFloatingButtonPressed = false;

  void onFloatingButtonPressed(){
    isFloatingButtonPressed = !isFloatingButtonPressed;
    if(isFloatingButtonPressed == true){
      floatingButtonIcon = Icons.highlight_remove_outlined;
      floatingButtonColor = Colors.red;
      body = WaitingConnectionsBody();
    }
    else{
      floatingButtonIcon = Icons.person_add_alt_1_outlined;
      floatingButtonColor = Colors.green;
      body = AcceptedConnectionBody();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: body != null? body : AcceptedConnectionBody(),
      floatingActionButton: FloatingButtonTemplate(
        icon: floatingButtonIcon,
        press: onFloatingButtonPressed,
        color: floatingButtonColor,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
//////// AcceptedConnectionBody
class AcceptedConnectionBody extends StatefulWidget {
  @override
  _AcceptedConnectionBodyState createState() => _AcceptedConnectionBodyState();
}

class _AcceptedConnectionBodyState extends State<AcceptedConnectionBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        SafeArea(
          child: Text(
            'My Teachers',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        Divider(height: 10, thickness: 3, color: Colors.white,),
        Expanded(
            child: ListView(
          children: StudentData.student.teachers.where((c) => c.studentAns == 'Accepted').map(
                (e) => AcceptedConnectionsCard(
              teacher: e.teacher,
              delete: ()async{
                DeleteConnection _deleteConnection = DeleteConnection(StudentData.student.id, e.teacher.id);
                Map response = await _deleteConnection.sendDeleteConnectionRequest();

                if(response['success'] == true){
                  // delete subject you get from de deleted teacher
                  // find subjects
                  try{
                    List<Subject> mustDeletedSubjects = StudentData.student.subjects.where((s) => s.teacher == e.teacher.id);
                    // send delete requests
                    mustDeletedSubjects.map(
                      (s) async {
                        LeaveSubject _leaveSubject = LeaveSubject(StudentData.student.id, s.id);
                        Map response = await _leaveSubject.sendLeaveSubjectRequest();
                        if(response['success'] == false){
                          print(response['error']);
                        }
                      }
                    );
                    setState(() {});
                  }
                  catch(e){
                    print(e);
                  }
                }
                else{
                  print(response['error']);
                }
              },
              color: Theme.of(context).accentColor,
            ),
          ).toList(),
        )
        ),
      ],
    );
  }
}
///////

/////// WaitingConnectionsBody
class WaitingConnectionsBody extends StatefulWidget {
  @override
  _WaitingConnectionsBodyState createState() => _WaitingConnectionsBodyState();
}

class _WaitingConnectionsBodyState extends State<WaitingConnectionsBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Text(
            'Waiting Requests',
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        Divider(height: 10, thickness: 3, color: Colors.white,),
        Expanded(
          child: ListView(
          children: StudentData.student.teachers.where((c) => c.studentAns == '').map(
                (e) => WaitingConnectionsCard(
              teacher: e.teacher,
              accept: ()async{
                AnswerConnectionRequest _answerConnection = AnswerConnectionRequest('Accepted', e.id);
                Map response = await _answerConnection.sendAnswerConnectionRequest();
                if(response['success'] == true){
                  Iterable teachersList = response['data'];
                  List<Connection> teachers = teachersList.map((i) =>
                      Connection.fromJson(i)).toList();
                  StudentData.student.teachers = teachers;
                }
                else{
                  print(response['error']);
                }
              },
              reject: ()async{
                AnswerConnectionRequest _answerConnection = AnswerConnectionRequest('Rejected', e.id);
                Map response = await _answerConnection.sendAnswerConnectionRequest();
                if(response['success'] == true){
                  Iterable teachersList = response['data'];
                  List<Connection> teachers = teachersList.map((i) =>
                      Connection.fromJson(i)).toList();
                  StudentData.student.teachers = teachers;
                }
                else{
                  print(response['error']);
                }
              },
              color: Theme.of(context).accentColor,
            ),
          ).toList(),
        )
        )
      ],
    );
  }
}
///////