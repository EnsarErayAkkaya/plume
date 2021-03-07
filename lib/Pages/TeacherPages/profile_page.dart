import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/teacher.dart';
import 'package:plume/Pages/AuthorizationPages/choose_role_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          SizedBox(height: size.height * 0.01,),
          SafeArea(
            child: CircleButton(
              press: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('login', false);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context){
                        return ChooseRolePage();
                      }
                  ),
                );
              },
              icon: Icons.logout,
              color: Theme.of(context).accentColor,
            ),
          ),
          SizedBox(height: size.height * 0.4,),
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

class CircleButton extends StatelessWidget {
  final Function press;
  final IconData icon;
  final Color color;

  const CircleButton({Key key, this.press, this.icon, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,//Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(30)
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            )
          ),
          SizedBox(width: size.width * 0.01,),
        ],
      )
    );
  }
}
