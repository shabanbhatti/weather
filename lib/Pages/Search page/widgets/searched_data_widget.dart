import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_project/Pages/Home%20page/home_page.dart';
import 'package:weather_project/Pages/Search%20page/controllers/is_searched_controller.dart';
import 'package:weather_project/Pages/Search%20page/controllers/search_filter_list_controller.dart';
import 'package:weather_project/controllers/api_controller.dart';
import 'package:weather_project/controllers/db_controller.dart';

class SearchedDataWidget extends StatelessWidget {
  const SearchedDataWidget({super.key, required this.scale});
  final Animation<double> scale;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ScaleTransition(
        scale: scale,
        child: Consumer(
          builder: (context, ref, child) {
            var myREF = ref.watch(dbProvider);
            var filterList = ref.watch(filterListProvider);
            return switch (myREF) {
              DbLoadingState() => const CupertinoActivityIndicator(
                color: Colors.white,
                radius: 13,
              ),
              DbLoadedSuccessfulyState(list: _) => ListView.builder(
                shrinkWrap: true,
                itemCount: filterList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder:
                    (context, index) => ListTile(
                      onTap: () {
                        ref
                            .read(apiSerProvider.notifier)
                            .fetchWeather(city: filterList[index].searchHistory)
                            .then((value) {
                              ref
                                  .read(filterListProvider.notifier)
                                  .updateList();
                                Navigator.of(
                                      context,
                                    ).pushNamedAndRemoveUntil(Home.pageName, (route) => false,);
                            });
                        ref.read(isSearchedProvider.notifier).foo();
                      },
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.search, color: Colors.white),
                      ),
                      title: Text(
                        filterList[index].searchHistory.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          ref
                              .read(dbProvider.notifier)
                              .delete(filterList[index])
                              .then((value) {
                                ref
                                    .read(filterListProvider.notifier)
                                    .updateList();
                              });
                        },
                        icon:const Icon(Icons.close, color: Colors.white),
                      ),
                    ),
              ),
              DbErrorState(error: var error) => Center(child: Text(error)),
              DbEmptyState() => Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: const Text(
                    'No search history',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            };
          },
        ),
      ),
    );
  }
}
