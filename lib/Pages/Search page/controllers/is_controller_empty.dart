
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isControllerEmptyProvider = StateNotifierProvider.autoDispose<IsControllerEmptyStateNotifier, bool>((ref) {
  return IsControllerEmptyStateNotifier();
});

class IsControllerEmptyStateNotifier extends StateNotifier<bool>{

  IsControllerEmptyStateNotifier():super(true);

  void onChangedControllerEmptyOrNot(String value){

if (value.isEmpty) {
  state= true;
}else{
  state= false;
}

  }
  
}