import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_project/repository/database_repository.dart';
import 'package:weather_project/services/database_service.dart';

final databaseServiceObjectProvider = Provider<DatabaseService>((ref) {
  return DatabaseService();
});

final databaseRepositoryObjectProvider = Provider<DatabaseRepository>((ref) {
  return DatabaseRepository(ref.read(databaseServiceObjectProvider));
});
