import 'package:flutter/material.dart';
import 'package:plume/Data/teacher_data.dart';
import 'package:plume/Pages/TeacherPages/subject_detail_page.dart';
import 'package:plume/Services/delete_subject.dart';
import 'package:plume/Services/update_subject.dart';
import 'package:plume/Widgets/SubjectWidgets/subject_card_template.dart';

class SubjectListView extends StatefulWidget {
  @override
  _SubjectListViewState createState() => _SubjectListViewState();
}

class _SubjectListViewState extends State<SubjectListView> {
  @override
  Widget build(BuildContext context) {
    //print('Subject List View:'+TeacherData.teacher.name + ':::'+ TeacherData.teacher.subjects[0].name);
    return ListView(
        padding: const EdgeInsets.all(8),
        children: TeacherData.teacher.subjects.map(
                (s) =>
                SubjectCardTemplate(
                  index: TeacherData.teacher.subjects.indexOf(s),
                  owner: (s.teacher == TeacherData.teacher.id
                      ? 'You'
                      : 'Dont know'),
                  details: (index) {
                    //print(index);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) {
                            return SubjectDetailPage(index: index);
                          }
                      ),
                    );
                  },
                  delete: (int index) async{
                    DeleteSubject deleteRequest = DeleteSubject(s.id);
                    Map deleteResponse = await deleteRequest.sendDeleteSubject();
                    if(deleteResponse['success'] == true){
                      //print('subject_list_view: success true');
                      setState(() {
                        TeacherData.teacher.subjects.removeAt(index);
                        //build(context);
                      });
                    }
                    else{
                      //print('subject_list_view: success false');
                      print(deleteResponse['error']);
                    }
                  },
                  edit: (int index, String editedName, Function onFail) async{
                    UpdateSubject updateSubject = UpdateSubject(s.id, editedName, TeacherData.teacher.id);
                    Map updateResponse = await updateSubject.sendUpdateSubject();
                    if(updateResponse['success'] == true){
                      //print('edit:success');
                      var data = updateResponse['data'];
                      TeacherData.teacher.subjects[index].name = data['name'];
                      TeacherData.teacher.printData();
                    }
                    else{
                      //print('FAIL');
                      print(updateResponse['error']);
                      onFail();
                    }
                  },
                )
        ).toList()
    );
  }
}