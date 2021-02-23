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
  static String formatDuration(Duration duration){
    String day = duration.inDays > 0 ? duration.inDays.toString() + 'day, ' : '';
    String hour = duration.inHours > 0 ? (duration.inHours - duration.inDays * 24).toString()+ ' hour, ' : '';
    String minute = duration.inMinutes > 0 ? (duration.inMinutes - duration.inHours * 60).toString()  + ' min remaining':'';
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
          print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
        },
        onConfirm: (date) {
          print('confirm $date');
          DatePicker.showTimePicker(context, showTitleActions: true,
          onChanged: (date)
          {
            onTimeChange(date);
            print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
          },
          onConfirm: (date) {
            print('confirm $date');
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