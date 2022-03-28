import 'package:burevi_weather/features/weather/presenataion/views/days/days_view.dart';
import 'package:burevi_weather/features/weather/presenataion/views/home/widgets/current_weather.dart';
import 'package:burevi_weather/features/weather/presenataion/views/home/widgets/forecasting_card_view.dart';
import 'package:burevi_weather/features/weather/presenataion/views/home/widgets/place_name.dart';
import 'package:burevi_weather/features/weather/presenataion/widgets/loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/app_bar.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  WeatherDetails? weatherDetails;

  String? country, locality;

  @override
  void initState() {
    super.initState();
    getCurrentLocationData();
  }

  getCurrentLocationData() async {
    Position position = await _determinePosition();
    await getAddressFromLatLong(position);
    await getWeatherData();
    setState(() {});
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placeMark[0];
    setState(() {
      country = place.country;
      locality = place.locality;
    });
  }

  getWeatherData() async {
    try {
      var response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/weather?q=$country&appid=c48cc178df6fe970fbe9d5fd1d9e697c",
      );
      if (response.data["cod"] == 200) {
        setState(() {
          weatherDetails = WeatherDetails(
              feelsLike: response.data["main"]["feels_like"].toDouble(),
              lat: response.data["coord"]["lat"].toDouble(),
              lon: response.data["coord"]["lon"].toDouble(),
              main: response.data["weather"][0]["main"],
              name: response.data["name"],
              pressure: response.data["main"]["pressure"].toDouble(),
              temp: response.data["main"]["temp"].toDouble(),
              weatherDescription: response.data["weather"][0]["description"],
              wind: response.data["wind"]["speed"].toDouble(),
              country: response.data["sys"]["country"]);
        });
        print(weatherDetails?.weatherDescription);
      } else {
        print("nothing!");
      }
    } catch (e) {
      print(e);
    }
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
                        country: country.toString(),
                        name: locality.toString(),
                      ),
                      CurrentWeather(
                        height: height,
                        weather: weatherDetails!,
                      ),
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
                      ForecastingCardView(
                          width: width,
                          height: height,
                          weather: weatherDetails!),
                    ],
                  )
                : const Loading(),
          ),
        ),
      ),
    );
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
