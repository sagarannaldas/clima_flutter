import 'package:clami_flutter/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clami_flutter/services/location.dart';
import 'package:clami_flutter/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
