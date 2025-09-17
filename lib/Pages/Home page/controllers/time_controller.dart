import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_project/models/timezone_model.dart';


final timeProvider = StateNotifierProvider<TimeStateNotifier, DateTime>((ref) {
  return TimeStateNotifier();
});

class TimeStateNotifier extends StateNotifier<DateTime> {

  Timer? timer;
  TimeStateNotifier(): super(DateTime.now());


void runSec(TimezoneModel time){

state = DateTime.parse(time.formatted ?? DateTime.now().toString());

timer?.cancel();

   timer=  Timer.periodic(Duration(seconds: 1), (_) {
      
        state= state.add(Duration(seconds: 1));
      
    });
}



@override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

}