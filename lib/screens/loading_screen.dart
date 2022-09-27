import 'package:flutter/material.dart';
import 'package:clami_flutter/services/location.dart';
import 'package:clami_flutter/services/networking.dart';

const apiKey = '367cd2a7e2b15827006957711279d553';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late Location location;
  late NetworkHelper networkHelper;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    location = Location();
    await location.getLocation();

    networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
