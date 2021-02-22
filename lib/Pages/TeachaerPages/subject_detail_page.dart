import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/subject.dart';
import 'package:plume/Widgets/AssignmentWidgets/assignment_create_widget.dart';
import 'package:plume/Widgets/StudentWidgets/add_student_widget.dart';
import 'package:plume/Widgets/SubjectWidgets/subject_detail_body.dart';
import 'package:plume/Widgets/Utility/floating_button_template.dart';


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
  bool createAssignment = false;

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
        bodyWidget = setSubjectDetailBody();
      });
    }
  }
  Widget setSubjectDetailBody(){
    return SubjectDetailBody(subject: widget.subject, addAssignment: (){
      setState(() {
        createAssignment = true;
        bodyWidget = AssignmentCreateWidget(
          subject: widget.subject,
          back: (){
            setState(() {
              createAssignment = false;
              bodyWidget = setSubjectDetailBody();
            });
          },
        );
      });
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: !createAssignment?AppBar(
        title: Text(
          widget.subject.name,
          style: TextStyle(
            fontSize: 25
          ),
        ),
      ): null,
      body: bodyWidget == null ? setSubjectDetailBody() : bodyWidget,
      floatingActionButton: Visibility(
        visible: !createAssignment,
        child:FloatingButtonTemplate(
          icon: actionButtonIcon,
          color: actionButtonColor,
          press: toggleAddStudent,
        ),
      )
    );
  }
}