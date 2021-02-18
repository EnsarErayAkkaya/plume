import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/subject.dart';
import 'package:plume/Services/add_student.dart';
import 'package:plume/Services/remove_student.dart';
import 'package:plume/Widgets/StudentWidgets/add_student_widget.dart';
import 'package:plume/Widgets/StudentWidgets/student_card_template.dart';
import 'package:plume/Widgets/StudentWidgets/student_list_view.dart';
import 'package:plume/Widgets/Utility/floating_button_template.dart';
import 'package:plume/Widgets/assignment_carousel_template.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/StudentWidgets/student_id_list_view.dart';

class SubjectDetailPage extends StatefulWidget {
  final int index;
  Subject subject;
  SubjectDetailPage({Key key, this.index}) : super(key: key){
    subject = TeacherData.teacher.subjects[index];
  }
  @override
  _SubjectDetailPageState createState() => _SubjectDetailPageState();
}

class _SubjectDetailPageState extends State<SubjectDetailPage> {
  bool addStudent = false;

  Widget bodyWidget;

  IconData actionButtonIcon = Icons.person_add;
  Color actionButtonColor = Colors.blue;

  void toggleAddStudent (){
    addStudent = !addStudent;

    if(addStudent == true){
      setState(() {
        actionButtonIcon = Icons.cancel;
        actionButtonColor = Colors.red;
        bodyWidget = AddStudentWidget(
          subjectStudents: widget.subject.students,
          subjectId: widget.subject.id,
          afterAddStudent: toggleAddStudent,
        );
      });
    }
    else{
      setState(() {
        actionButtonIcon = Icons.person_add;
        actionButtonColor = Colors.blue;
        bodyWidget = SubjectDetailBody(subject: widget.subject,);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          widget.subject.name,
          style: TextStyle(
            fontSize: 25
          ),
        ),
      ),
      body: bodyWidget == null ? SubjectDetailBody( subject: widget.subject) : bodyWidget,
      floatingActionButton: FloatingButtonTemplate(
        icon: actionButtonIcon,
        color: actionButtonColor,
        press: toggleAddStudent,
      ),
    );
  }
}
class SubjectDetailBody extends StatefulWidget {
  const SubjectDetailBody({
    Key key, this.subject,
  }) : super(key: key);

  final Subject subject;

  @override
  _SubjectDetailBodyState createState() => _SubjectDetailBodyState();
}

class _SubjectDetailBodyState extends State<SubjectDetailBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.fromLTRB(0,size.height * .01,0,0),
        child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(size.width * 0.05, 0, size.width * 0.05, 10),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Assignments',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ) ,
                      ),
                      Text(
                        'Count: ' + widget.subject.assignments.length.toString(),
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ) ,
                      ),
                      TextButton.icon(
                        icon: Icon(
                          Icons.add_box,
                          color: Theme.of(context).accentColor,
                          size: 28,
                        ),
                        label: const Text(
                          'Add',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 20
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
              ),
              AssignmentCarouselTemplate(assignments: widget.subject.assignments),
              SizedBox(height: size.height * 0.015,),
              Padding(
                padding: EdgeInsets.all(6),
                child:Divider(thickness: 3, color:Theme.of(context).primaryColor),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(size.width * 0.1, 0, size.width * 0.1, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Students',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ) ,
                      ),
                      Text(
                        'Count: ' + widget.subject.students.length.toString(),
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ) ,
                      ),
                    ],
                  )
              ),
              Column(
                children: widget.subject.students.map(
                  (e) => TeacherData.teacher.students.firstWhere((element) => element.id == e)).toList().map(
                    (e) => StudentCardTemplate(
                      student: e,
                      press: (String studentId) async {
                        RemoveStudent removeStudent = RemoveStudent(
                          TeacherData.teacher.id,
                          widget.subject.id,
                          studentId
                        );
                        Map removeResponse = await removeStudent.sendAddStudentRequest();
                        if(removeResponse['success'] == true){
                          print('removed');
                          //remove student
                          setState(() {
                            TeacherData.teacher.subjects.firstWhere(
                                    (s) => s.id == widget.subject.id
                            ).students.removeWhere((s) => s == studentId);
                          });
                        }
                        else{
                          print('error');
                        }
                    },
                    buttonIcon: Icons.person_remove,
                    buttonText: 'Remove Student',
                  ),
                ).toList(),
              )
            ]
        )
    );
  }
}