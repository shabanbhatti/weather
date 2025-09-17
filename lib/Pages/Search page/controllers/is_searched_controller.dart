import 'package:flutter_riverpod/flutter_riverpod.dart';

final isSearchedProvider = StateNotifierProvider.autoDispose<IsSearchedStateNotifier, bool>((ref) {
  return IsSearchedStateNotifier();
});

class IsSearchedStateNotifier extends StateNotifier<bool> {
  IsSearchedStateNotifier(): super(false);


void foo(){

state= true;

}


}