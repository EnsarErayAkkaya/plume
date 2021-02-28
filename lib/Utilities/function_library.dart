import 'dart:io';
import 'package:filesystem_picker/filesystem_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class FunctionLibrary{
  static String formatDateTime(DateTime date){
    String year = date.year.toString();
    String month = date.month.toString();
    String day = date.day.toString();
    String hour = date.hour.toString();
    String minute = date.minute.toString();

    return day +'/' + month +'/'+
        year+', ' +hour +':' +minute;
  }

  static DateTime formatDateForServer(DateTime date){
    print(date);
    /*DateTime res = date.subtract(
      Duration(
        hours: date.timeZoneOffset.inHours,
        minutes: date.timeZoneOffset.inMinutes - (date.timeZoneOffset.inHours * 60),
    ));
    print(res);*/
    return date;//res;
  }
  static DateTime formatDateForClient(DateTime date){
    print(date);
    print(DateTime.now().timeZoneName+": " +  DateTime.now().timeZoneOffset.toString());
    DateTime temp = date.add(
        Duration(
          hours: DateTime.now().timeZoneOffset.inHours,
          minutes: DateTime.now().timeZoneOffset.inMinutes - (DateTime.now().timeZoneOffset.inHours * 60),
        ));

    DateTime res = DateTime(temp.year, temp.month, temp.day,temp.hour, temp.minute, temp.second);
    print(res);
    return res;
  }

  static String formatDuration(DateTime endDate){
    Duration duration = endDate.difference(DateTime.now());
    print('now :' + DateTime.now().toString());
    print('endDate :' + endDate.toString());
    print('timezone: ' + endDate.timeZoneOffset.toString());
    String day = duration.inDays > 0 ? duration.inDays.toString() + 'day, ' : '';
    String hour = duration.inHours > 0 ? (duration.inHours - duration.inDays * 24 ).toString()+ ' hour, ' : '';
    String minute = duration.inMinutes > 0 ? (duration.inMinutes - duration.inHours * 60 ).toString()  + ' min remaining':'';
    return day + hour+ minute;
  }
  static void pickTime(BuildContext context, Function onDateChange, onTimeChange) {

     DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime(DateTime.now().year + 1, DateTime.now().month, DateTime.now().day),
        theme: DatePickerTheme(
            headerColor: Colors.orange,
            backgroundColor: Colors.blue,
            itemStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            doneStyle: TextStyle(color: Colors.white, fontSize: 16)
        ),
        onChanged: (date) {
          onDateChange(date);
          //print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
        },
        onConfirm: (date) {
          print('confirm $date');
          DatePicker.showTimePicker(context, showTitleActions: true,
          onChanged: (time)
          {
            time = date.add(Duration(hours: time.hour, minutes: time.minute, seconds: time.second));
            onTimeChange(time);
            //print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
          },
          onConfirm: (time) {
            time = date.add(Duration(hours: time.hour, minutes: time.minute, seconds: time.second));
            print('confirmed date : $time');
          }, currentTime: DateTime.now());
        },
        currentTime: DateTime.now(), locale: LocaleType.en);
  }
  static void pickFile(BuildContext context, Function onConfirm) async{
    FileTileSelectMode filePickerSelectMode = FileTileSelectMode.checkButton;
    String path = await FilesystemPicker.open(
      title: 'Open file',
      context: context,
      rootDirectory: Directory('storage'),//new Directory('path_to_root'),
      fsType: FilesystemType.file,
      folderIconColor: Colors.teal,
      allowedExtensions: ['.txt', '.png', '.jpg', '.pdf', '.doc'],
      fileTileSelectMode: filePickerSelectMode,
      requestPermission: () async {
        var storageStatus = await Permission.storage.status;
        print(storageStatus);

        if (!storageStatus.isGranted)
          await Permission.storage.request();

        if(await Permission.storage.isGranted)
          return true;
        else
          return false;
      },
    );
    if(path != null){
      onConfirm(File(path));
    }else{
      print('file not found error');
    }
  }
}