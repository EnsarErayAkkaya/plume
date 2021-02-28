import 'package:flutter/material.dart';
import 'package:plume/Widgets/Utility/floating_button_template.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/SubjectWidgets/create_subject.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/SubjectWidgets/subject_list_view.dart';

class SubjectsPage extends StatefulWidget {
  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage>
  with AutomaticKeepAliveClientMixin{

  bool isCreatingSubject = false;

  Widget bodyWidget;

  void setBodyWidget()
  {
    isCreatingSubject = !isCreatingSubject;
    setState(() {
      if(isCreatingSubject){
        bodyWidget = CreateSubject();
      }
      else{
        bodyWidget = SubjectListView();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:SafeArea(
        child:bodyWidget == null?SubjectListView(): bodyWidget,
      ),
      floatingActionButton: FloatingButtonTemplate(
        icon: isCreatingSubject?Icons.cancel_sharp:Icons.add,
        press: setBodyWidget,
        color: isCreatingSubject? Colors.red:Theme.of(context).primaryColor,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}