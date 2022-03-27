
import 'package:burevi_weather/features/weather/presenataion/views/home/home_view.dart';
import 'package:flutter/material.dart';

class ForecastingCardView extends StatelessWidget {
  const ForecastingCardView({
    Key? key,
    required this.width,
    required this.height, required this.weather,
  }) : super(key: key);

  final double width;
  final WeatherDetails weather;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: (height * 0.15),
      child: ListView.builder(
        itemCount: 14,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Card(
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("12:00"),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: (height * 0.015),
                  ),
                  child: const Icon(
                    Icons.cloud,
                  ),
                ),
                const Text("25\u00b0"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
