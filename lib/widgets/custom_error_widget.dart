import 'package:flutter/material.dart';
import 'package:weather_project/Pages/Search%20page/search_page.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.error});
final String error;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
    slivers: [
      SliverAppBar(
        leading: const SizedBox(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Weather',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(SearchPage.pageName);
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            error,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
  }
}