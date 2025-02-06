import 'package:flutter/material.dart';

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
    // Placeholder for actual weather fetching logic
    setState(() {
      _cityName = _cityController.text;
      _temperature = "Temperature: 23°C";  // Mock data
      _weatherCondition = "Condition: Sunny";  // Mock data
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
                backgroundColor: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Text(_cityName, style: Theme.of(context).textTheme.titleLarge),
            Text(_temperature, style: Theme.of(context).textTheme.titleMedium),
            Text(_weatherCondition, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
