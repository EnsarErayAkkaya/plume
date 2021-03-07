import 'package:flutter/material.dart';
import 'package:plume/Models/student.dart';

class StudentCardTemplate extends StatelessWidget {
  final Student student;
  final Function press;
  final String buttonText;
  final IconData buttonIcon;
  final Color color;
  final Color buttonColor;
  const StudentCardTemplate({
    Key key, this.student, this.press, this.buttonText, this.buttonIcon, @required this.color, this.buttonColor = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('student template: ' + student.name);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: color,
        child: Column(
            children: [
              ListTile(
                leading: Icon(
                    Icons.person,
                    color: Theme.of(context).scaffoldBackgroundColor
                ),
                title: Text(
                  student.name + ' ' + student.surname,
                  style:  TextStyle(
                      color: Colors.white,
                      fontSize: 20),
                ),
                subtitle: Text(
                  student.email,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                //color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: color,
                    width: 8,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton.icon(
                      icon: Icon(
                        buttonIcon,
                        color: buttonColor,
                        size: 35,
                      ),
                      label: Text(
                        buttonText,
                        style: TextStyle(
                            color: buttonColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                      onPressed:() => press(student.id ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              )
            ]
        )
    );
  }
}