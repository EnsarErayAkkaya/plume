import 'package:flutter/material.dart';
import 'package:plume/Models/subject.dart';
import 'package:plume/Utilities/function_library.dart';
import 'package:plume/Widgets/Utility/big_rounded_input_field.dart';
import 'package:plume/Widgets/Utility/rounded_button.dart';
import 'package:plume/Widgets/Utility/rounded_input_field.dart';

class AssignmentCreateWidget extends StatefulWidget {
  const AssignmentCreateWidget({Key key, this.subject}) : super(key: key);

  @override
  _AssignmentCreateWidgetState createState() => _AssignmentCreateWidgetState();
  final Subject subject;
}

class _AssignmentCreateWidgetState extends State<AssignmentCreateWidget> {

  String title;
  String desc;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String errorText = ' ';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children:[
          SizedBox(height: size.height * 0.05,),
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
          Expanded(
          child:ListView(
            padding: const EdgeInsets.all(8),
            children: [
              SizedBox(height: size.height * 0.05,),
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
              SizedBox(height: size.height * 0.02,),
              PickDateTimeButton(
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
                    startDate != null? 'Start Date:'+FunctionLibrary.formatDateTime(startDate):'',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Text(
                errorText == null?' ': errorText,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.red[700],
                ),
              ),
              SizedBox(height: size.height * 0.02,),
              RoundedButton(
                text: 'Create',
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                //Login on press
                press: () {},
              ),
              ],
            ),
          )
        ]
      )
    );
  }
}

class PickDateTimeButton extends StatelessWidget {
  const PickDateTimeButton({
    Key key, this.onDateChange, this.onTimeChange,
  }) : super(key: key);
  final Function onDateChange;
  final Function onTimeChange;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap:() => FunctionLibrary.pickTime(context, onDateChange, onTimeChange),
      child: Container(
        height: 60.0,
        width: size.width * 0.3,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            'Pick Start Date',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
