import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState() {
    getLocation();

    super.initState();
  }

  void getData() async {
    String api = '831dc0058f0b3cf50dc536ee9beaca78';
    http.Response res = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$api&units=metric'));

    if (res.statusCode == 200) {
      String data = res.body;
      var decodedData = jsonDecode(data);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LocationScreen(
                locationData: decodedData,
              )));
    } else {
      print(res.statusCode);
    }
  }

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: SpinKitDoubleBounce(
      color: Colors.purple,
      size: 100,
    ));
  }
}
