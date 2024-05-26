import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/constants.dart';

class WeatherCard extends StatelessWidget {
  final String day;
  final String condition;
  final String temperature;

  const WeatherCard({
    required this.day,
    required this.condition,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    String path = getAnimationPath(condition);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            day,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Lottie.asset(
            path,
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            condition,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          Text(
            temperature,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

String getAnimationPath(String condition) {
  switch (condition) {
    case 'Cloudy':
      return Assets.partlycloudy;
    case 'raining':
      return Assets.raining;
    case 'Mostly sunny':
      return Assets.sunny;
    case 'Mostly cloudy':
      return Assets.cloudy;
    default:
      return Assets.others;
  }
}

Widget cardWidget(
  String day,
  String condition,
  String temperature,
  // IconData iconData,
  String path,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          day,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        Lottie.asset(
          path,
          // decoder: customDecoder,
        ),
        Text(
          condition,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        Text(
          temperature,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}