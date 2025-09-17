import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_project/controllers/api_controller.dart';
import 'package:weather_project/controllers/db_controller.dart';
import 'package:weather_project/routes/on_generate_route.dart';
import 'package:weather_project/Pages/Search%20page/controllers/search_filter_list_controller.dart';
import 'package:weather_project/Pages/Intro%20page/intro_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  var container = ProviderContainer();
  container.read(apiSerProvider.notifier).fetchWeather();
  container.read(dbProvider.notifier).fetch();
  container.read(filterListProvider.notifier).addData();
  runApp(UncontrolledProviderScope(container: container ,child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('MAIN BUILD CALLED');
    return MaterialApp(
      initialRoute: IntroPage.pageName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
