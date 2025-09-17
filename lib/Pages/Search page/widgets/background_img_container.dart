import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_project/controllers/api_controller.dart';
import 'package:weather_project/utils/get_weather_img_method.dart';
import 'package:weather_project/utils/hours_for_background_img_method.dart';
import 'package:weather_project/utils/all_weathers_img_paths.dart';

class BackgroundImgContainer extends StatelessWidget {
  const BackgroundImgContainer({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        var weatherState = ref.watch(apiSerProvider);
        return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image:
                    (weatherState is LoadedSuccessfuly)
                        ? DecorationImage(
                          image: AssetImage(
                            getWeatherImage(
                              condition: weatherState.weather.list![0].weather![0].main!,
                              isDay: isDay(weatherState.time.formatted!),
                            ),
                          ),
                          fit: BoxFit.cover,
        
                          opacity: 0.9,
                        )
                        : DecorationImage(
                          image: AssetImage(rain_night),
                          fit: BoxFit.cover,
                        ),
              ),
              child: child,
            );
      }
    );
  }
}