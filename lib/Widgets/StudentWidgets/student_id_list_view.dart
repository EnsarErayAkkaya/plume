import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/student.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/StudentWidgets/student_list_view.dart';

class StudentIDListView extends StatelessWidget {
  List<Student> students;
  final Function onPress;
  final String buttonText;
  final IconData buttonIcon;
  final Color color;
  StudentIDListView(List<String> studentIDs, this.onPress, this.buttonText, this.buttonIcon, this.color){
    students = studentIDs.map(
            (e) => TeacherData.teacher.students.firstWhere((element) => element.id == e)
    ).toList();
  }
  @override
  Widget build(BuildContext context) {
    return StudentsListView(
      students: students,
      onPress: onPress,
      buttonIcon: buttonIcon,
      buttonText: buttonText,
      color: color,
    );
  }
}
