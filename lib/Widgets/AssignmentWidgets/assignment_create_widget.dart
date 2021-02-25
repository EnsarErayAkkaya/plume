import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/assignment.dart';
import 'package:plume/Models/subject.dart';
import 'package:plume/Services/create_assignment.dart';
import 'package:plume/Utilities/function_library.dart';
import 'package:plume/Widgets/Utility/big_rounded_input_field.dart';
import 'package:plume/Widgets/Utility/pick_date_time_button.dart';
import 'package:plume/Widgets/Utility/pick_file_button.dart';
import 'package:plume/Widgets/Utility/rounded_button.dart';
import 'package:plume/Widgets/Utility/rounded_input_field.dart';

class AssignmentCreateWidget extends StatefulWidget {
  const AssignmentCreateWidget({Key key, this.subject, this.back}) : super(key: key);

  @override
  _AssignmentCreateWidgetState createState() => _AssignmentCreateWidgetState();
  final Subject subject;
  final Function back;
}

class _AssignmentCreateWidgetState extends State<AssignmentCreateWidget> {

  String title;
  String desc;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String errorText = ' ';

  String filename;
  
  bool buttonDisabled = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children:[
          SafeArea(
            child:Container(
              alignment: Alignment.bottomLeft,
              color: Theme.of(context).primaryColor,
              height: size.height * 0.08,
              width: size.width,
              child: TextButton.icon(
                onPressed: widget.back,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 28,
                ),
                label: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child:Text(
                    'Go to Subject',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                    ),
                  )
                )
              ),
            ),
          ),
          Expanded(
          child:ListView(
            padding: const EdgeInsets.all(8),
            children: [
              SizedBox(height: size.height * 0.04,),
              Center(
                child: Text(
                    'Create Assignment',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              RoundedInputField(
                hintText: 'Title',
                icon: Icons.title,
                onChanged: (value){title = value;},
              ),
              SizedBox(height: size.height * 0.02,),
              BigRoundedInputField(
                hintText: 'Description',
                icon: Icons.description,
                onChanged: (value){desc = value;},
              ),
              SizedBox(height: size.height * 0.03,),
              PickFileButton(onConfirm: (File f){
                filename = f.path;
                setState(() {});
              },),
              SizedBox(height: size.height * 0.015,),
              Center(
                child: Text(
                    filename != null? 'File: '+ filename:'',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              SizedBox(height: size.height * 0.05,),
              PickDateTimeButton(
                buttonText: 'Pick Start Date',
                onDateChange: (DateTime date){
                  print('confirmed by eray: ' + date.toString());
                  setState(() {
                    startDate = date;
                  });
                },
                onTimeChange: (DateTime date){
                  print('confirmed by eray: ' + date.toString());
                  setState(() {
                    startDate = date;
                  });
                },
              ),
              SizedBox(height: size.height * 0.01,),
              Center(
                child: Text(
                    startDate != null? 'Start Date: '+FunctionLibrary.formatDateTime(startDate):'',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              PickDateTimeButton(
                buttonText: 'Pick End Date',
                onDateChange: (DateTime date){
                  print('confirmed by eray: ' + date.toString());
                  setState(() {
                    endDate = date;
                  });
                },
                onTimeChange: (DateTime date){
                  print('confirmed by eray: ' + date.toString());
                  setState(() {
                    endDate = date;
                  });
                },
              ),
              SizedBox(height: size.height * 0.01,),
              Center(
                child: Text(
                    endDate != null? 'End Date: '+FunctionLibrary.formatDateTime(endDate):'',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Center(
                child:Text(
                  errorText == null?' ': errorText,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.red[700],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              RoundedButton(
                text: 'Create',
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                //Login on press

                press: () async {
                  if(buttonDisabled == true) return;

                  buttonDisabled = true;
                  CreateAssignment _createAssignment = CreateAssignment(title, desc, startDate, endDate, filename, widget.subject.id);
                  Map _assignmentData = await _createAssignment.sendCreateAssignmentRequest();
                  if(_assignmentData['success'] == true){
                    print('success ' + _assignmentData['data']['title']);
                    TeacherData.teacher.subjects.firstWhere((element) => element.id == widget.subject.id).assignments
                        .add(Assignment.fromJson(_assignmentData['data']));
                    setState(() {
                      errorText = 'success';
                      buttonDisabled = false;
                    });
                  }else{
                    print('Create assignment failed, Error: ' + _assignmentData['error']);
                    setState(() {
                      errorText = _assignmentData['error'];
                      buttonDisabled = false;
                    });
                  }
                },
              ),
              ],
            ),
          )
        ]
      )
    );
  }
}


