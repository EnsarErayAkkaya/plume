import 'package:flutter/material.dart';
import 'package:plume/Models/teacher.dart';

class WaitingConnectionsCard extends StatelessWidget {
  final Teacher teacher;
  final Function accept;
  final Function reject;
  final Color color;
  const WaitingConnectionsCard({
    Key key, this.teacher, this.accept, @required this.color, this.reject,
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
                        'Decline',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                      onPressed: reject,
                    ),
                    const SizedBox(width: 8),
                    TextButton.icon(
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 35,
                      ),
                      label: Text(
                        'Accept',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),
                      ),
                      onPressed:accept,
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
