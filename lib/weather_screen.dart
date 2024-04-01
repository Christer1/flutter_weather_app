import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';


class WeatherScrren extends StatefulWidget {
  const WeatherScrren({super.key});

  @override
  State<WeatherScrren> createState() => _WeatherScrrenState();
}

class _WeatherScrrenState extends State<WeatherScrren> {

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {

    try {

    String cityName = 'Ibadan';
    final res = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$openWeatherAPIKey'
        )
      );
      final data = jsonDecode(res.body);

      if(data['code'] != '200'){
        throw 'An unexpected error occurred';
      }


    } catch (e) {
      throw e.toString();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Weather App', style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
            }, 
            icon: const Icon(Icons.refresh),
            ),
        ],
      ),

      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '300K', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                          
                          SizedBox(height: 20),
                    
                          Icon(Icons.cloud, size: 64),
                                      
                          SizedBox(height: 20),
                    
                          Text('Rain', style: TextStyle(fontSize: 32),)
                            
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
      
            const SizedBox(height: 20),
            const Text(
              "Weather Forecast", 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:  Row(
                  children: [
                       HourlyForecastItem(
                        time: '00:00',
                        icon: Icons.cloud,
                        temperature: '301.22',
                       ),
                       HourlyForecastItem(
                        time: '03:00',
                        icon: Icons.sunny,
                        temperature: '300.52',
                       ),
                        HourlyForecastItem(
                        time: '06:00',
                        icon: Icons.cloud,
                        temperature: '302.22',
                       ),
                        HourlyForecastItem(
                        time: '09:00',
                        icon: Icons.sunny ,
                        temperature: '300.12',
                       ),
                        HourlyForecastItem(
                        time: '12:00',
                        icon: Icons.cloud,
                        temperature: '304.12',
                       ),
                  ],
                ),
              ),
              
            const SizedBox(height: 20),
            //additional info
            const Text(
              "Additional Infortmation", 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AdditionalInfoItem(
                icon: Icons.water_drop,
                text: 'Humidity',
                value: '91',
              ),
              AdditionalInfoItem(
                icon: Icons.air,
                text: 'Wind Speed',
                value: '7.5',
              ),
              AdditionalInfoItem(
                icon: Icons.beach_access,
                text: 'Pressure',
                value: '1000',
              ),
            ],  
            )
            
          ],
        ),
      ),

    );
  }
}

