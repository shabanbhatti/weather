import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_project/models/search_history_model.dart';
import 'package:weather_project/providers/database_provider_objects.dart';
import 'package:weather_project/repository/database_repository.dart';



final dbProvider = StateNotifierProvider<DbStateNotifier, DbState>((ref) {
  return DbStateNotifier(databaseRepository: ref.read(databaseRepositoryObjectProvider));
});



class DbStateNotifier extends StateNotifier<DbState> {
  final DatabaseRepository databaseRepository;
  DbStateNotifier({required this.databaseRepository}) : super(DbLoadingState());

  Future<List<SearchHistoryModel>?> fetch() async {
    try {
      var data = await databaseRepository.fetch()??[];
      if (data.isEmpty) {
        state = DbEmptyState();
      } else {
        state = DbLoadedSuccessfulyState(list: data);
      }
      return data;
    } catch (e) {
      state = DbErrorState(error: e.toString());
      return null;
    }
  }

  Future<bool> insert(SearchHistoryModel modalClass) async {
    try {
      var data = await databaseRepository.insert(modalClass);
      return data;
    } catch (e) {
      state = DbErrorState(error: e.toString());
      return false;
    }
  }

  Future<bool> delete(SearchHistoryModel modalClass) async {
    try {
      var data = await databaseRepository.delete(modalClass);

      if (data) {
        await fetch();
      }
      return true;
    } catch (e) {
      state = DbErrorState(error: e.toString());
      return false;
    }
  }

  Future<void> deleteAlll() async {
    print('DELETE ALL CALLED');
    var data = await databaseRepository.deleteAlll();

    if (data) {
      await fetch();
      
    }
  }
}

sealed class DbState {
  const DbState();
}

class DbLoadingState extends DbState {
  const DbLoadingState();
}

class DbLoadedSuccessfulyState extends DbState {
  final List<SearchHistoryModel> list;
  const DbLoadedSuccessfulyState({required this.list});
}

class DbErrorState extends DbState {
  final String error;
  const DbErrorState({required this.error});
}

class DbEmptyState extends DbState {
  const DbEmptyState();
}
