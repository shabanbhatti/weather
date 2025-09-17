import 'package:intl/intl.dart';

String dateFormat( String date) {
    
    DateTime dateTime = DateTime.parse(date);

    String formattedDate = DateFormat('EEEE, d MMMM y').format(dateTime);

    return formattedDate;
  }

  String timeFormat(String time) {
    
    DateTime dateTime = DateTime.parse(time);

    String formattedTime = DateFormat.jm().format(dateTime);
    return formattedTime;
  }

  String hourMinutesSeconds(DateTime timeDateSeconds){
    return DateFormat(
                            'hh:mm:ss a',
                          ).format(timeDateSeconds);
  }