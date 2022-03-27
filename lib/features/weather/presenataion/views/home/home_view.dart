import 'package:burevi_weather/features/weather/presenataion/views/days/days_view.dart';
import 'package:burevi_weather/features/weather/presenataion/views/home/widgets/current_weather.dart';
import 'package:burevi_weather/features/weather/presenataion/views/home/widgets/forecasting_card_view.dart';
import 'package:burevi_weather/features/weather/presenataion/views/home/widgets/place_name.dart';
import 'package:burevi_weather/features/weather/presenataion/widgets/loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/app_bar.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  WeatherDetails? weatherDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: weatherDetails != null
                ? Column(
                    children: [
                      PlaceName(
                        height: height,
                        country: weatherDetails!.country,
                        name: weatherDetails!.name,
                      ),
                      CurrentWeather(height: height, weather: weatherDetails!),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: (height * 0.03),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Today",
                              style: GoogleFonts.lato(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const DaysPage(),
                              )),
                              child: Row(
                                children: [
                                  Text(
                                    "Next 7 Days ",
                                    style: GoogleFonts.lato(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const Icon(
                                    Icons.navigate_next,
                                    color: Colors.black54,
                                    size: 28,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ForecastingCardView(width: width, height: height,weather:weatherDetails!),
                    ],
                  )
                : const Loading(),
          ),
        ),
      ),
    );
  }

  getWeatherData() async {
    try {
      var response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/weather?q=ampara&appid=c48cc178df6fe970fbe9d5fd1d9e697c",
      );
      if (response.data["cod"] == 200) {
        setState(() {
          weatherDetails = WeatherDetails(
              feelsLike: response.data["main"]["feels_like"],
              lat: response.data["coord"]["lat"],
              lon: response.data["coord"]["lon"],
              main: response.data["weather"][0]["main"],
              name: response.data["name"],
              pressure: response.data["main"]["pressure"].toDouble(),
              temp: response.data["main"]["temp"],
              weatherDescription: response.data["weather"][0]["description"],
              wind: response.data["wind"]["speed"],
              country: response.data["sys"]["country"]);
        });
        print(weatherDetails?.wind);
      } else {
        print("nothing!");
      }
    } catch (e) {
      print(e);
    }
  }
}

class WeatherDetails {
  double lon, lat, wind, temp, pressure, feelsLike;
  String main, weatherDescription, name, country;

  WeatherDetails(
      {required this.lon,
      required this.lat,
      required this.wind,
      required this.temp,
      required this.pressure,
      required this.feelsLike,
      required this.main,
      required this.weatherDescription,
      required this.name,
      required this.country});
}
