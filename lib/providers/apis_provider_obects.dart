import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_project/repository/api_repository.dart';
import 'package:weather_project/services/api_service.dart';

final apiServiceProviderObject = Provider<ApiService>((ref) {
  return ApiService();
});

final apiRepositoryProviderObject = Provider<ApiRepository>((ref) {
  return ApiRepository(apiService: ref.read(apiServiceProviderObject));
});