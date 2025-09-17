import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  const NoInternetConnectionWidget({super.key, this.reload});
  final void Function()? reload;
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
                    Consumer(
                      builder:
                          (context, ref, child) => Padding(
                            padding: EdgeInsets.all(5),
                            child: IconButton(
                              onPressed: reload,
                              icon: const Icon(
                                Icons.refresh,
                                color: Colors.white,
                                size: 30,
                              ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.wifi_off, size: 50, color: Colors.white),
                SizedBox(height: 20),
                Text(
                  'No Internet Connection',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
