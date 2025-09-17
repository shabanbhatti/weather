import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_project/Pages/Home%20page/controllers/time_controller.dart';
import 'package:weather_project/Pages/Search%20page/search_page.dart';
import 'package:weather_project/models/weather_API_model.dart';
import 'package:weather_project/utils/date_time_format_method.dart';
import 'package:weather_project/widgets/custom_text_rich_widget.dart';

class MySliverAppBar extends StatefulWidget {
  const MySliverAppBar({
    super.key,
    required this.weather,
    required this.dateFormat,
  });
  final WeatherModel weather;
  final String dateFormat;

  @override
  State<MySliverAppBar> createState() => _MySliverAppBarState();
}

class _MySliverAppBarState extends State<MySliverAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slide;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slide = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));
    scale = Tween<double>(begin: 0.7, end: 1.0).animate(controller);
    Future.delayed(const Duration(milliseconds: 500), () {
      controller.forward();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: const SizedBox(),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(SearchPage.pageName);
                },
                icon: const Icon(Icons.search, color: Colors.white, size: 35),
              ),
            ),
          ],
        ),
      ],
      expandedHeight: 480,
      backgroundColor: Colors.black.withAlpha(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),

      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SlideTransition(
              position: slide,
              child: ScaleTransition(
                scale: scale,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        widget.weather.city?.name ?? 'No name',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        widget.dateFormat,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Image.network(
                              'https://openweathermap.org/img/wn/${widget.weather.list![0].weather![0].icon}@2x.png',

                              height: 150,
                              width: 100,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Text(
                              '${(widget.weather.list![0].main!.temp! - 273.15).toStringAsFixed(0)}°C',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Consumer(
                        builder: (context, apiTimeREF, child) {
                          String formatted = hourMinutesSeconds(
                            apiTimeREF.watch(timeProvider),
                          );
                          return CustomTextRichWidget(
                            title: 'Time Zone',
                            value: formatted,
                            fontSize: 17,
                          );
                         
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1),
                      child: Text(
                        widget.weather.list![0].weather![0].main.toString(),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: CustomTextRichWidget(
                        title: 'Feels like',
                        value:
                            '${(widget.weather.list![0].main!.feelsLike! - 273.15).toStringAsFixed(0)}°C',
                        fontSize: 18,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: CustomTextRichWidget(
                              fontSize: 16,
                              title: 'Max temp',
                              value:
                                  '${(widget.weather.list![0].main!.tempMin! - 273.15).toStringAsFixed(0)}°C',
                            ),
                          ),

                          Flexible(
                            child: CustomTextRichWidget(
                              fontSize: 16,
                              title: 'Min temp',
                              value:
                                  '${(widget.weather.list![0].main!.tempMin! - 273.15).toStringAsFixed(0)}°C',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
