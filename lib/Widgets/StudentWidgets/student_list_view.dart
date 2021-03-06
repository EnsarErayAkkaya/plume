import 'package:flutter/material.dart';
import 'package:plume/Models/student.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/StudentWidgets/student_card_template.dart';

class StudentsListView extends StatelessWidget {
  final List<Student> students;
  final Function onPress;
  final String buttonText;
  final IconData buttonIcon;
  final Color color;
  final Color buttonColor;
  const StudentsListView({
    Key key,
    this.students, this.onPress, this.buttonText, this.buttonIcon, @required this.color, this.buttonColor = Colors.red
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: students.map(
            (e) => StudentCardTemplate(
              student: e,
              press: onPress,
              buttonIcon: buttonIcon,
              buttonText: buttonText,
              color: color,
              buttonColor: buttonColor,
        ),
      ).toList(),
    );
  }
}
