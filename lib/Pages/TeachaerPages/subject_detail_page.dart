import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/subject.dart';
import 'package:plume/Services/add_student.dart';
import 'package:plume/Widgets/StudentWidgets/add_student_widget.dart';
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
        bodyWidget = SubjectDetail(subject: widget.subject,);
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
      body: bodyWidget == null ? SubjectDetail( subject: widget.subject) : bodyWidget,
      floatingActionButton: FloatingButtonTemplate(
        icon: actionButtonIcon,
        color: actionButtonColor,
        press: toggleAddStudent,
      ),
    );
  }
}

class SubjectDetail extends StatelessWidget {
  const SubjectDetail({
    Key key, this.subject,
  }) : super(key: key);

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(0,size.height * .01,0,0),
      child: Column(
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
                  'Count: ' + subject.assignments.length.toString(),
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
          //Assignments Carousel
          AssignmentCarouselTemplate(assignments:subject.assignments),
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
                  'Count: ' + subject.students.length.toString(),
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ) ,
                ),
              ],
            )
          ),
          //students
          Expanded(
              child: StudentIDListView(
                subject.students,
                (){},
                'Remove Student',
                Icons.person_remove,
              ),
          )
        ],
      ),
    );
  }
}
