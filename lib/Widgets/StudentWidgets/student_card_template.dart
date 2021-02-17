import 'package:flutter/material.dart';
import 'package:plume/Models/student.dart';

class StudentCardTemplate extends StatelessWidget {
  final Student student;
  final Function press;
  final String buttonText;
  final IconData buttonIcon;
  const StudentCardTemplate({
    Key key, this.student, this.press, this.buttonText, this.buttonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print('student template: ' + student.name);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Theme.of(context).accentColor,
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
                  color: Theme.of(context).accentColor,
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
                        color: Colors.red,
                        size: 35,
                      ),
                      label: Text(
                        buttonText,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                      onPressed:() => press(student.id),
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