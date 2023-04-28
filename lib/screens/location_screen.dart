import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/weather_Model.dart';

class LocationScreen extends StatefulWidget {
  final locationData;
  const LocationScreen({super.key, this.locationData});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late final city;
  late final country;
  late final temp;
  late final condition;

  @override
  void initState() {
    updateUI(widget.locationData);
    super.initState();
  }

  void updateUI(weatherData) {
    city = weatherData['city']['name'];
    country = weatherData['country'];
    // temp = weatherData['list'][0]['main']['temp'];
    // int condition = weatherData['list'][1]['weather'][0]['id'];
    temp = [];
    for (int i = 0; i < 5; i++) {
      double t = weatherData['list'][i]['main']['temp'];
      temp.add(t.toInt());
    }
    print(temp);

    condition = [];
    for (int j = 0; j < 5; j++) {
      int c = weatherData['list'][j]['weather'][0]['id'];
      condition.add(c);
    }
    print(condition);
  }

  @override
  Widget build(BuildContext context) {
    int currentTemp = temp[0];
    int temp1 = temp[1];
    int temp2 = temp[2];
    int temp3 = temp[3];
    int temp4 = temp[4];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 23,
                      ),
                      Text(city,
                          style: GoogleFonts.openSans(
                              color: Colors.black45, fontSize: 28))
                    ],
                  ),
                  Icon(
                    Icons.menu,
                    size: 25,
                  )
                ],
              ),
            ),
            Center(
              child: Text(
                'The current temperature is $currentTemp °C',
                style:
                    GoogleFonts.montserrat(fontSize: 36, color: Colors.black),
              ),
            ),
            Container(
              width: double.infinity,
              height: 420,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 209, 203, 203),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text('Weather app by CSI MJCET',
                          style: GoogleFonts.mukta(
                              color: Color.fromARGB(255, 240, 100, 58),
                              fontSize: 22,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        weather_Widget(
                          condition: condition,
                          temp1: temp1,
                          num: 1,
                          temperature: temp1.toString(),
                        ),
                        weather_Widget(
                          condition: condition,
                          temp1: temp2,
                          num: 2,
                          temperature: temp2.toString(),
                        ),
                        weather_Widget(
                          condition: condition,
                          temp1: temp3,
                          num: 3,
                          temperature: temp3.toString(),
                        ),
                        weather_Widget(
                          condition: condition,
                          temp1: temp4,
                          num: 4,
                          temperature: temp4.toString(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class weather_Widget extends StatelessWidget {
  const weather_Widget({
    super.key,
    required this.condition,
    required this.temp1,
    required this.num,
    required this.temperature,
  });

  final condition;
  final int temp1;
  final int num;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 270,
        width: 120,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Image.asset(
            WeatherModel.getWeatherIcon(condition[num]),
            height: 70,
            width: 70,
          ),
          Text(
            temperature,
            style: const TextStyle(color: Colors.red, fontSize: 25),
          ),
        ]),
      ),
    );
  }
}
