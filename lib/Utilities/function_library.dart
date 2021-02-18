import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    String hour = duration.inHours > 0 ? duration.inHours.toString()+ ' hour, ' : '';
    String minute = duration.inMinutes > 0 ? duration.inMinutes.toString()  + ' min remaining':'';
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
}