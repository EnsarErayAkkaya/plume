import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/subject.dart';
import 'package:plume/Widgets/Utility/CardButtonTemplate.dart';
import 'package:plume/Widgets/Utility/rounded_input_field.dart';

class SubjectCardTemplate extends StatefulWidget {
  final int index;
  Subject subject;
  final String owner;
  final Function delete;
  final Function edit;
  final Function details;

  SubjectCardTemplate({this.owner, this.delete, this.edit, this.details, this.index}){
    subject = TeacherData.teacher.subjects[index];
    //print(subject.name +' Initialized, index :' + index.toString());
  }

  @override
  _SubjectCardTemplateState createState() => _SubjectCardTemplateState();
}

class _SubjectCardTemplateState extends State<SubjectCardTemplate> {
  Widget titleWidget;
  Widget buttonsWidget;
  String editedName = '';

  void editModeOff(BuildContext context){
    setState(() {
      titleWidget = SubjectTitle(name: widget.subject.name, owner: widget.owner,);
      buttonsWidget = CardButtonsTemplate(
        details:() => widget.details(widget.index),
        delete:() => widget.delete(widget.index),
        edit: () => editModeOn(context),
      );
    });
  }
  void editModeOn(BuildContext context)
  {
    setState(() {
      titleWidget = SubjectCardEditTitle(
        widget: widget,
        onChange: (String value) {
          editedName = value;
        },
      );
      buttonsWidget = SubjectEditConfirm(
        edit: () async{
          await widget.edit(widget.index, editedName, editModeOff(context));
          editModeOff(context);
        },
        changeEditMode: () =>  editModeOff(context),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    //print(widget.subject.name +' Builded');
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget == null? SubjectTitle(name:widget.subject.name, owner:widget.owner): titleWidget,
              buttonsWidget == null? CardButtonsTemplate(
                details:() => widget.details(widget.index),
                delete:() => widget.delete(widget.index),
                edit: () => editModeOn(context),
              ) : buttonsWidget
            ]
        )
    );
  }
}

class SubjectTitle extends StatelessWidget {
  const SubjectTitle({
    Key key,
    @required this.name, this.owner,
  }) : super(key: key);

  final String name;
  final String owner;

  @override
  Widget build(BuildContext context) {
    //print(name +', Subject Title Builded');
    return Container(
      height: 65,
      child :Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child:Icon(
              Icons.subject,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5 , 0, 0),
                child: Text(
                  owner,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class SubjectCardEditTitle extends StatelessWidget {

  const SubjectCardEditTitle({
    Key key,
    @required this.widget, this.onChange,
  }) : super(key: key);

  final Function onChange;
  final SubjectCardTemplate widget;

  @override
  Widget build(BuildContext context) {
    //print(widget.subject.name +', SubjectCardEditTitle Builded');
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child:RoundedInputField(
        hintText: widget.subject.name,
        icon: Icons.edit,
        onChanged:(value) => onChange(value),
      )
    );
  }
}

class SubjectEditConfirm extends StatelessWidget {
  final Function edit;
  final Function changeEditMode;

  const SubjectEditConfirm({Key key, this.edit, this.changeEditMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(', SubjectEditConfirm Builded');
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 8,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton.icon(
            icon: Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            label: const Text(
              'Cancel',
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),
            onPressed: changeEditMode,
          ),
          const SizedBox(width: 8),
          TextButton.icon(
            icon: Icon(
              Icons.check_circle,
              color: Colors.blue,
            ),
            label: const Text(
              'Confirm',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),
            onPressed: edit,
          ),
        ],
      ),
    );
  }
}
