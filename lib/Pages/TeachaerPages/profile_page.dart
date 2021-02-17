import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/teacher.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    super.build(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size.height * 0.6,),
          //Divider
          /*Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
                height: 15,
                thickness: 3,
                color: Theme.of(context).primaryColor
            ),
          ),*/
          //name surname
          Padding(
            padding: EdgeInsets.all(20),
             child: Text(
                TeacherData.teacher.name + ' ' + TeacherData.teacher.surname,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor
                ),
              )
          ),
          SizedBox(height: size.height * 0.025,),
          // email
          Padding(
              padding: EdgeInsets.all(1),
              child: Text(
                TeacherData.teacher.email,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor
                ),
              )
          ),
          SizedBox(height: size.height * 0.05,),
          // Students and Subjects count
          Column(
            children: [
              //Divider(height: 15, thickness: 3, color: Theme.of(context).primaryColor,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Column(
                    children: [
                      Text(
                        TeacherData.teacher.subjects.length.toString(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'SUBJECTS',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        TeacherData.teacher.students.length.toString(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'STUDENTS',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
              //Divider(height: 15, thickness: 3, color: Theme.of(context).primaryColor,),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
