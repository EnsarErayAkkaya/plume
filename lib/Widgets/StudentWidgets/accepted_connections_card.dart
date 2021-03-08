import 'package:flutter/material.dart';
import 'package:plume/Models/teacher.dart';

class AcceptedConnectionsCard extends StatelessWidget {
  final Teacher teacher;
  final Function delete;
  final Color color;
  const AcceptedConnectionsCard({
    Key key, this.teacher, this.delete, @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  teacher.name + ' ' + teacher.surname,
                  style:  TextStyle(
                      color: Colors.white,
                      fontSize: 20),
                ),
                subtitle: Text(
                  teacher.email,
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
                        Icons.highlight_remove_sharp,
                        color: Colors.red,
                        size: 35,
                      ),
                      label: Text(
                        'Delete',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                      onPressed:delete,
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
