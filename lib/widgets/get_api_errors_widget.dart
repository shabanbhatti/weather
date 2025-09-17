import 'package:flutter/material.dart';
import 'package:weather_project/widgets/custom_error_widget.dart';
import 'package:weather_project/widgets/no_internet_connection_widget.dart';

Widget getErrorWidget(String error, BuildContext context, {void Function()? onReload, String? on404ErrorTitle}) {
  if (error.contains('SocketException') ||
      error.contains('Failed host lookup')) {
    return NoInternetConnectionWidget(
      reload: onReload,
    );
  } else if (error.contains('404')) {
    return CustomErrorWidget(error: on404ErrorTitle??'',);
  } else if (error.contains('TimeoutException')) {
    return Text('⏱️ Request Timed Out', style: TextStyle(color: Colors.white));
  } else {
    return Text('❌ Error: $error', style: TextStyle(color: Colors.white));
  }
}