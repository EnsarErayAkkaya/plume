import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Models/assignment.dart';
import 'package:plume/Models/subject.dart';
import 'package:plume/Pages/TeacherPages/assignment_detail_page.dart';
import 'file:///C:/Eray/Flutter/plume/lib/Widgets/AssignmentWidgets/assignment_carousel_item_template.dart';
import 'package:plume/Services/delete_assignment.dart';

class AssignmentCarouselTemplate extends StatefulWidget {
  final List<Assignment> assignments;
  final String subjectId;
  final Function edit;

  const AssignmentCarouselTemplate({Key key,this.assignments, this.subjectId, this.edit}) : super(key: key);

  @override
  _AssignmentCarouselTemplateState createState() => _AssignmentCarouselTemplateState();
}

class _AssignmentCarouselTemplateState extends State<AssignmentCarouselTemplate> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CarouselSlider(
      options: CarouselOptions(
        height: size.height * 0.4,
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 2.0,
        initialPage: 2,
      ),
      items: widget.assignments.map((e) => AssignmentCarouselItemTemplate(
        assignment: e,
        delete: () async{
          DeleteAssignment _deleteAssignment = DeleteAssignment(e.id, TeacherData.teacher.id, widget.subjectId);
          Map deleteResponse = await _deleteAssignment.sendDeleteAssignment();
          if(deleteResponse['success'] == true){
            Subject s = TeacherData.teacher.subjects.firstWhere((s) => s.id == widget.subjectId);
            s.assignments.remove(e);
            print('Assignment ' + e.title + ' deleted');
            setState(() {});
          }else{
            print('Couldnt delete assignment: ' + deleteResponse['error']);
          }
        },
        edit: () => widget.edit(
          widget.subjectId,
          e
        ),
        details: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context){
                  return AssignmentDetailPage(assignment: e,);
                }
            ),
          );
        },
      )).toList(),
    );
  }
}
