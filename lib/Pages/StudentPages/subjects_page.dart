import 'package:flutter/material.dart';

class SubjectsPage extends StatefulWidget {
  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage>
    with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(child:Text('Subject Student'));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}