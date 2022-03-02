import 'package:flutter/material.dart';
import 'package:sky_clean_weather_app/constants.dart';

const api =
    'https://api.openweathermap.org/data/2.5/weather?q=peshawar&appid=3d6d8ca187e1d7e3828c4ba2092b61f9&units=metric';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({
    Key? key,
    required this.wind,
    required this.temperature,
    required this.humidity,
    required this.description,
    required this.cityName,
  }) : super(key: key);
  final double wind;
  final double temperature;
  final int humidity;
  final String description;
  final String cityName;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool iconButtonColor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B0C20),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Today\'s Report',
                  style: headingText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.location_on_outlined,
                        size: 30, color: Colors.blue),
                    Text(
                      'Peshawar',
                      style: cityName,
                    ),
                  ],
                ),
                Image.asset(
                  'images/loadingImage.jpg',
                  fit: BoxFit.contain,
                ),
                Text(
                  'Its Cloudy',
                  style: headingText,
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${widget.temperature}°',
                  style: tempNo,
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 26, vertical: 33),
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: 32,
                      ),
                      CloudIcons(
                        imageUrl: 'images/1.png',
                        humidity: '23Km/h',
                        sky: 'Sun',
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      CloudIcons(
                        imageUrl: 'images/2.png',
                        humidity: '${widget.humidity}',
                        sky: 'Humidity',
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      CloudIcons(
                        imageUrl: 'images/3.png',
                        humidity: '${widget.description}',
                        sky: 'Weather',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xff16182a),
                borderRadius: BorderRadius.circular(19)),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      iconButtonColor = !iconButtonColor;
                    });
                  },
                  icon: Icon(
                    Icons.home_filled,
                    size: 40,
                    color: iconButtonColor ? Colors.blue : Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.explore_outlined,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person_outline,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class CloudIcons extends StatelessWidget {
  const CloudIcons({Key? key, this.imageUrl, this.humidity, this.sky})
      : super(key: key);

  final String? imageUrl;
  final String? humidity;
  final String? sky;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageUrl.toString()),
        SizedBox(
          height: 8.0,
        ),
        Text(
          humidity.toString(),
          style: normalText,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          sky.toString(),
          style: greyText,
        ),
      ],
    );
  }
}
