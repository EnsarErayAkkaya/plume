import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: showAppBar?AppBar(
        title: Text(
          widget.assignment.title,
          style: TextStyle(
              fontSize: 25
          ),
        ),
      ): null,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.05,),
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
              widget.assignment.file !=null &&widget.assignment.file != ''? Container(
                child: Row(
                  children: [
                    SizedBox(width: 0.05,),
                    RaisedButton.icon(
                      onPressed: (){},
                      icon: Icon(
                        Icons.download_sharp,
                        color: Colors.orange,
                      ),
                      label: Text(
                        'Download Attached File',

                      )
                    ),
                  ],
                )
              ):SizedBox(height: 0,),
            ],
          ),
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
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
      ),
      child:Column(
        children: [
          SizedBox(height: size.height * 0.01,),
          Row(
            children: [
              SizedBox(width: size.width * 0.05,),
              Text(
                title,
                style: TextStyle(
                    color:Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          Divider(height: 10, color: Colors.grey[800], thickness: 0.5,),
          Row(
            children: [
              SizedBox(width: size.width * 0.05,),
              Container(
                width: size.width*0.90,
                child:Text(
                  data,
                  style: TextStyle(
                      color:Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                )
              ),
            ],
          ),
          SizedBox(height: size.height * 0.025,)
        ],
      )
    );
  }
}
