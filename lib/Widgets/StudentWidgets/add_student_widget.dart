import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Services/add_student.dart';
import 'package:plume/Widgets/StudentWidgets/student_id_list_view.dart';

class AddStudentWidget extends StatelessWidget {
  final List<String> subjectStudents;
  final String subjectId;
  final Function afterAddStudent;
  const AddStudentWidget({Key key, this.subjectStudents, this.subjectId, this.afterAddStudent}) : super(key: key);

  List<String> getNonExistingStudents(){
    List<String> ids = List<String>();
    for(int i = 0; i < TeacherData.teacher.students.length;i ++){
      if(subjectStudents.any((element) => TeacherData.teacher.students[i].id == element) == true){
        continue;
      }
      else{
        ids.add(TeacherData.teacher.students[i].id);
      }
    }
    return ids;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: size.height * 0.05,),
        Text(
          'Add New Student',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: size.height * 0.025,),
        Expanded(
            child: StudentIDListView(
              getNonExistingStudents(),
              (String studentId) async{
                AddStudent addStudent = AddStudent(
                  TeacherData.teacher.id,
                  subjectId,
                  studentId
                );
                Map studentResponse = await addStudent.sendAddStudentRequest();
                if(studentResponse['success'] == true){
                  TeacherData.teacher.subjects.firstWhere(
                          (e) => e.id == subjectId
                  ).students.add(studentId);
                  afterAddStudent();
                }
                else{
                  print(studentResponse['error']);
                  afterAddStudent();
                }
              },
              'Add Student',
              Icons.person_add_alt_1,
              Theme.of(context).accentColor,
            )
        )
      ],
    );
  }
}