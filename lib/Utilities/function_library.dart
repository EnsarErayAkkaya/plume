class FunctionLibrary{
  static String formatDateTime(DateTime date){
    return date.day.toString() +'/' +date.month.toString() +'/'+
        date.year.toString()+', ' +date.hour.toString() +':' +date.minute.toString();
  }
  static String formatDuration(Duration duration){
    String day = duration.inDays > 0 ? duration.inDays.toString() + 'day, ' : '';
    String hour = duration.inHours > 0 ? duration.inHours.toString()+ ' hour, ' : '';
    String minute = duration.inMinutes > 0 ? duration.inMinutes.toString()  + ' min remaining':'';
    return day + hour+ minute;
  }
}