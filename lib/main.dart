import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WeatherInfoPage(title: 'Weather Information'),
    );
  }
}

class WeatherInfoPage extends StatefulWidget {
  const WeatherInfoPage({super.key, required this.title});

  final String title;

  @override
  State<WeatherInfoPage> createState() => _WeatherInfoPageState();
}

class _WeatherInfoPageState extends State<WeatherInfoPage> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = "Enter a city";
  String _temperature = "Temperature: --";
  String _weatherCondition = "Condition: --";

  void _fetchWeather() {
    final random = Random();
    int temp = 15 + random.nextInt(16); // Generates a random temperature between 15 and 30
    List<String> conditions = ["Sunny", "Cloudy", "Rainy"];
    String condition = conditions[random.nextInt(conditions.length)];

    setState(() {
      _cityName = _cityController.text.isNotEmpty ? _cityController.text : "Unknown City";
      _temperature = "Temperature: $temp°C";
      _weatherCondition = "Condition: $condition";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Enter a city",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 8), // Adds a little space
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'City Name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search)
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, //change color here
              ),
            ),
            SizedBox(height: 20),
            Text(
              _cityName,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              _temperature,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              _weatherCondition,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
