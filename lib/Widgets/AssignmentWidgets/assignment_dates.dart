import 'package:flutter/material.dart';
import 'package:plume/Models/assignment.dart';
import 'package:plume/Utilities/function_library.dart';

class AssignmentDates extends StatelessWidget {
  const AssignmentDates({
    Key key,
    @required this.assignment,
  }) : super(key: key);

  final Assignment assignment;

  @override
  Widget build(BuildContext context) {
    print('end Date is:' + assignment.endDate.toString());
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
            assignment.endDate.isBefore(DateTime.now())?
            '' : FunctionLibrary.formatDuration(assignment.endDate),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white
            )
        ),
      ],
    );
  }
}