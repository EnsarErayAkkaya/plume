import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/assignment.dart';
import 'package:plume/Services/delete_assignment.dart';
import 'package:plume/Utilities/function_library.dart';
import 'package:plume/Widgets/Utility/CardButtonTemplate.dart';

class AssignmentCarouselItemTemplate extends StatelessWidget {
  final Assignment assignment;
  final Function delete;
  final Function details;
  final Function edit;

  const AssignmentCarouselItemTemplate(
    {Key key, this.assignment, this.delete, this.details, this.edit}
  ) : super(key: key);

  String assignmentDesc(String desc) {
    return desc.length < 60? desc:desc.substring(0,60) + '...';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width ,
      height: size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8,0,0,0),
            child: Text(
              assignment.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ) ,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8,0,0,0),
            child: Text(
              assignmentDesc(assignment.description),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ) ,
            ),
          ),
          AssignmentDates(assignment: assignment),
          CardButtonsTemplate(
            details: details,
            delete: delete,
            edit: edit,
          ),
        ],
      ),
    );
  }
}

class AssignmentDates extends StatelessWidget {
  const AssignmentDates({
    Key key,
    @required this.assignment,
  }) : super(key: key);

  final Assignment assignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            'Started at: ' + FunctionLibrary.formatDateTime(assignment.startDate),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white
            )
        ),
        Text(
            (assignment.endDate.isBefore(DateTime.now())?'Finished at: ': 'Until :') + FunctionLibrary.formatDateTime(assignment.endDate),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white
            )
        ),
        Text(
            assignment.endDate.isBefore(DateTime.now())?'': FunctionLibrary.formatDuration(assignment.endDate.difference(DateTime.now())),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white
            )
        ),
      ],
    );
  }
}
