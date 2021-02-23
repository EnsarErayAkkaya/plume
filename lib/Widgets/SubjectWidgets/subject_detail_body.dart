import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/subject.dart';
import 'package:plume/Services/remove_student.dart';
import 'package:plume/Widgets/AssignmentWidgets/assignment_create_widget.dart';
import 'package:plume/Widgets/StudentWidgets/student_card_template.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/AssignmentWidgets/assignment_carousel_template.dart';

class SubjectDetailBody extends StatefulWidget {
  const SubjectDetailBody({
    Key key, this.subject, this.addAssignment,
  }) : super(key: key);

  final Subject subject;
  final Function addAssignment;
  @override
  _SubjectDetailBodyState createState() => _SubjectDetailBodyState();
}

class _SubjectDetailBodyState extends State<SubjectDetailBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.fromLTRB(0,size.height * .01,0,0),
        width: size.width,
        child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(size.width * 0.025, 0, size.width * 0.025, 0),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Assignments',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ) ,
                      ),
                      Text(
                        'Count: ' + widget.subject.assignments.length.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ) ,
                      ),
                      TextButton.icon(
                        icon: Icon(
                          Icons.add_box,
                          color: Theme.of(context).accentColor,
                          size: 22,
                        ),
                        label: const Text(
                          'Add',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),
                        ),
                        onPressed: widget.addAssignment,
                      ),
                    ],
                  )
              ),
              //SizedBox(height: size.height * 0.01,),
              AssignmentCarouselTemplate(
                assignments: widget.subject.assignments,
                subjectId: widget.subject.id,
              ),
              SizedBox(height: size.height * 0.01,),
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ) ,
                      ),
                      Text(
                        'Count: ' + widget.subject.students.length.toString(),
                        style: TextStyle(
                            fontSize: 18,
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