import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/subject.dart';
import 'package:plume/Services/add_subject.dart';
import 'package:plume/Widgets/Utility/rounded_button.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/Utility/rounded_input_field.dart';

class CreateSubject extends StatefulWidget {
  @override
  _CreateSubjectState createState() => _CreateSubjectState();
}

class _CreateSubjectState extends State<CreateSubject> {
  String name;
  String error='';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child:Text(
            'Create Subject',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
            ),
          ),
        ),
        SizedBox(height: size.height * 0.05,),
        RoundedInputField(
          hintText: 'Subject Name',
          icon: Icons.label,
          onChanged: (value) {name = value;},
        ),
        //SizedBox(height: size.height * 0.01,),
        Padding(
          padding: EdgeInsets.all(6),
          child: Text(
            (error == '' || error == null)?' ': error,
            style: TextStyle(
              color: Colors.red,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.01,),
        RoundedButton(
          text: 'CREATE',
          color:Theme.of(context).primaryColor,
          textColor: Colors.white,
          press: () async{
            AddSubject addSubject = new AddSubject(name:name,teacher: TeacherData.teacher.id);
            Map createdSubject = await addSubject.sendAddSubjectRequest();
            if(createdSubject['success'] == true){
              setState(() {
                error = 'Successful!';
                TeacherData.teacher.subjects.add(
                    Subject.fromJson(createdSubject['data'])
                );
              });
            }
            else{
              setState(() {
                error = createdSubject['error'];
              });
            }
          },
        )
      ],
    );
  }
}
