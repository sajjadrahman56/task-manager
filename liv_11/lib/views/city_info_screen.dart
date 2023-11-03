import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:liv_11/model/weather_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeatherData> weatherDataList = [];

  @override
  void initState() {
    super.initState();
    String jsonString = '''
    [
       {

    "city": "New York",

    "temperature": 20,

    "condition": "Clear",

    "humidity": 60,

    "windSpeed": 5.5

  },

  {

    "city": "Los Angeles",

    "temperature": 25,

    "condition": "Sunny",

    "humidity": 50,

    "windSpeed": 6.8

  },

  {

    "city": "London",

    "temperature": 15,

    "condition": "Partly Cloudy",

    "humidity": 70,

    "windSpeed": 4.2

  },

  {

    "city": "Tokyo",

    "temperature": 28,

    "condition": "Rainy",

    "humidity": 75,

    "windSpeed": 8.0

  },

  {

    "city": "Sydney",

    "temperature": 22,

    "condition": "Cloudy",

    "humidity": 55,

    "windSpeed": 7.3

  }
    ]
    ''';
    weatherDataList = (jsonDecode(jsonString) as List)
        .map((i) => WeatherData.fromJson(i))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Info App ',style: TextStyle(color: Colors.white),),
      
      backgroundColor: Colors.blue,),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount:weatherDataList.length,
          itemBuilder: (context, index){
            return ListTile(
              title:  Text("City: ${weatherDataList[index].city!}", style: Theme.of(context).textTheme.bodyText1),
              subtitle: Text('Temperature: ${weatherDataList[index].temperature}\u00B0C'
              '\nCondition: ${weatherDataList[index].condition}\n'
              'Humidity: ${weatherDataList[index].humidity}%\n'
              'Wind Speed: ${weatherDataList[index].windSpeed} m/s'),
            );
          }, 
          separatorBuilder: (_,__){
            return Divider();
          }, 
          ),
      ),
      // body: ListView.builder(
      //   itemCount: weatherDataList.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(weatherDataList[index].city!),
      //       subtitle: Text('Temperature: ${weatherDataList[index].temperature}, Condition: ${weatherDataList[index].condition}, Humidity: ${weatherDataList[index].humidity}, Wind Speed: ${weatherDataList[index].windSpeed}'),
      //     );
      //   },
      // ),
    );
  }
}