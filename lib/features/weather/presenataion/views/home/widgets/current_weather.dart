
import 'package:burevi_weather/features/weather/presenataion/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'current_weather_data_unit.dart';

class CurrentWeather extends StatefulWidget {

  const CurrentWeather({
    Key? key,
    required this.height, required this.weather,
  }) : super(key: key);

  final double height;
  final WeatherDetails weather;

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String formatter = DateFormat.MMMMEEEEd('en_US').format(now);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: (widget.height * 0.02),
              bottom: (widget.height * 0.015),
            ),
            child: Image.asset(
              "assets/images/cloudy.png",
              height: 50,
              width: 50,
            ),
          ),
          Text(
            widget.weather.weatherDescription,
            style: GoogleFonts.lato(
              color: Colors.white70,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: (widget.height * 0.01),
            ),
            child: Text(
              formatter,
              style: GoogleFonts.lato(
                color: Colors.white38,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: (widget.height * 0.015),
            ),
            child: Text(
              "${(widget.weather.temp-273.15).ceil()}\u00b0",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
            height: 0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(flex: 1,child: CurrentWeatherDataUnit(height: widget.height,name:"WIND",value: "${widget.weather.wind.toString()}\u00b0")),
              SizedBox(
                height: (widget.height * 0.1),
                child: const VerticalDivider(
                  color: Colors.white,
                ),
              ),
              Expanded(flex: 1,child: CurrentWeatherDataUnit(height: widget.height,name:"FEELS LIKE",value: "${(widget.weather.feelsLike-273.15).ceil().toString()}kwj")),
            ],
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
            height: 0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(flex: 1,child: CurrentWeatherDataUnit(height: widget.height,name:"INDEX UV",value: "${widget.weather.wind.toString()}kwj")),
              SizedBox(
                height: (widget.height * 0.1),
                child: const VerticalDivider(
                  color: Colors.white,
                ),
              ),
              Expanded(flex: 1,child: CurrentWeatherDataUnit(height: widget.height,name:"PRESSURE",value: "${widget.weather.pressure.toString()}mbar")),
            ],
          ),
        ],
      ),
    );
  }
}
