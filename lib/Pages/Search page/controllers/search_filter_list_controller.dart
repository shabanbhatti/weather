import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_project/models/search_history_model.dart';
import 'package:weather_project/providers/database_provider_objects.dart';
import 'package:weather_project/repository/database_repository.dart';



final filterListProvider =
    StateNotifierProvider<FilterListStateNotifier, List<SearchHistoryModel>>((
      ref,
    ) {
      return FilterListStateNotifier(databaseRepository:  ref.read(databaseRepositoryObjectProvider));
    });

class FilterListStateNotifier extends StateNotifier<List<SearchHistoryModel>> {
  final DatabaseRepository databaseRepository;
  FilterListStateNotifier({required this.databaseRepository}) : super([]);

  Future<void> addData() async {
    List<SearchHistoryModel> data = await databaseRepository.fetch()??[];

    var myList = [...data.reversed];

    state = myList;
  }

  Future<void> onChanged(String value) async {
    if (value.isNotEmpty) {
      var fileredList =
          state
              .where(
                (element) => element.searchHistory!.toLowerCase().startsWith(
                  value.toLowerCase().trim(),
                ),
              )
              .toList();

      state = [...fileredList];
    } else {
      var data = await databaseRepository.fetch()??[];
      state = [...data.reversed];
    }
  }

  Future<void> updateList() async {
    var data = await databaseRepository.fetch()??[];
    state = [...data.reversed];
  }
}
