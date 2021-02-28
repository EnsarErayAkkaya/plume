import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:plume/Models/assignment.dart';
import 'package:plume/Utilities/function_library.dart';

class AssignmentDetailPage extends StatefulWidget {
  final Assignment assignment;

  const AssignmentDetailPage({Key key, this.assignment}) : super(key: key);

  @override
  _AssignmentDetailPageState createState() => _AssignmentDetailPageState();
}

class _AssignmentDetailPageState extends State<AssignmentDetailPage> {

  bool showAppBar = true;

  @override
  Widget build(BuildContext context) {
    FunctionLibrary.formatDateForServer(DateTime.now());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: showAppBar?AppBar(
        title: Text(
          'Assignment Details',
          style: TextStyle(
              fontSize: 25
          ),
        ),
      ): null,
      body: ListView(
        children: [
          Container(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.025,),
                TitleDataSet(
                  title: 'Title',
                  data: widget.assignment.title,

                ),
                SizedBox(height: size.height * 0.025,),
                TitleDataSet(
                  title: 'Description',
                  data: widget.assignment.description,

                ),
                SizedBox(height: size.height * 0.025,),
                TitleDataSet(
                  title: 'Start Date',
                  data: FunctionLibrary.formatDateTime(widget.assignment.startDate),
                ),
                SizedBox(height: size.height * 0.025,),
                TitleDataSet(
                  title: 'End Date',
                  data: FunctionLibrary.formatDateTime(widget.assignment.endDate),
                ),
                SizedBox(height: size.height * 0.025,),
                widget.assignment.file !=null &&widget.assignment.file != ''?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.65,
                        child:RaisedButton.icon(
                          color: Colors.amber,
                          onPressed: (){},
                          icon: Icon(
                            Icons.download_sharp,
                            color: Colors.black,
                          ),
                          label: Text(
                            'Download Attached File',
                            style: TextStyle(
                              fontSize: 18
                            ),
                          )
                        )
                      ),
                    ],
                  ):SizedBox(height: 0,),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.025,),
          Divider(height: 6, thickness: 6, color: Theme.of(context).accentColor,),
          SizedBox(height: size.height * 0.025,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: size.width * 0.1,),
              Text(
                'Answers',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: size.width * 0.1,),
              Text(
                'Count: ' + widget.assignment.assignmentAnswers.length.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: size.width * 0.1,),
            ],
          ),
          Column(
            children: [],
          )
        ],
      )
    );
  }
}

class TitleDataSet extends StatelessWidget {
  const TitleDataSet({
    Key key, this.title, this.data
  }) : super(key: key);

  final String title;
  final String data;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Container(
        child:Row(
          children: [
            SizedBox(width: size.width * 0.03,),
            Container(
              alignment: Alignment.centerLeft,
              width: size.width * 0.32,
              child:Text(
                title + ': ',
                style: TextStyle(
                    color:Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: size.width * 0.65,
              child:Text(
                data,
                style: TextStyle(
                    color:Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              )
            )
          ],
        )
      );
  }
}
