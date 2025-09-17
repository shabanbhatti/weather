
import 'package:weather_project/models/search_history_model.dart';
import 'package:weather_project/services/database_service.dart';

class DatabaseRepository {
  final DatabaseService databaseService;

  const DatabaseRepository(this.databaseService);

  Future<List<SearchHistoryModel>?> fetch() async {
    try {
      return await databaseService.fetchData();
    } catch (e) {
      return null;
    }
  }

  Future<bool> insert(SearchHistoryModel modalClass) async {
    try {
      return await databaseService.insertData(modalClass);
      
    } catch (e) {
      return false;
    }
  }

  Future<bool> delete(SearchHistoryModel modalClass) async {
    try {
      return await databaseService.deleteData(modalClass);

    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteAlll() async {
    print('DELETE ALL CALLED');
    return await databaseService.deleteAll();
  }
}
