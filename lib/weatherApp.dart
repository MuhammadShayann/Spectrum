import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Weather.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late Future<Weather> _futureWeather;

  @override
  void initState() {
    super.initState();
    _futureWeather = Weather.fetch('your-api-key', 44.34, 10.99);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: Center(
          child: FutureBuilder<Weather>(
            future: _futureWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final weather = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${weather.temperature}°C',
                      style: TextStyle(fontSize: 48),
                    ),
                    Image.network(weather.iconUrl),
                    Text(
                      weather.description,
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      weather.locationName,
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
