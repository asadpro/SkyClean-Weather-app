import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sky_clean_weather_app/constants.dart';
import 'package:sky_clean_weather_app/loading_screen.dart';
import 'package:sky_clean_weather_app/networking.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    getDataFromNetworking();
  }

  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  late double wind;
  late double temperature;
  late int humidity;
  late String description;
  late String cityName;
  Future<void> getDataFromNetworking() async {
    NetworkHelper networkHelper = NetworkHelper();
    wind = networkHelper.wind;
    temperature = networkHelper.temp;
    humidity = networkHelper.humid;
    description = networkHelper.desc;
    cityName = networkHelper.cityName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B0C20),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'images/start.jpg',
            fit: BoxFit.contain,
          ),
          Text(
            'Discover the Weather in Your City',
            style: headingText,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            'Get to know your weather maps and\n radar precipitation forecast',
            textAlign: TextAlign.center,
            style: greyText,
          ),
          SizedBox(
            height: 54.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoadingScreen(
                                cityName: cityName,
                                wind: wind,
                                temperature: temperature,
                                humidity: humidity,
                                description: description,
                              )),
                    ),
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 24),
                ),
                style: getStartButton),
          )
        ],
      ),
    );
  }
}
