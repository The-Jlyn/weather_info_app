import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather App Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String cityName = "";
  int temperature = 0;
  String weather = "";
  List Weather = ['sunny','cloudy','rainy'];
  void _setCityName(String name) {
    setState(() {
      cityName = name;
    });
  }
  void _getTemperature() {
    setState(() {
      // var temperature = Random().nextInt(10);
      temperature = Random().nextInt(15) + 15;
    });
  }

  void _getWeather() {
    setState(() {
      int randomIndex = Random().nextInt(Weather.length);
      weather = (Weather[randomIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
   
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Input City Name"),
              onSubmitted: _setCityName,
            ),
            ElevatedButton(
            onPressed: (){
              _getWeather();
              _getTemperature();
              
            },
            child: const Text('Fetch Weather'),
            ),
            Text(
              'City Name: $cityName',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Temperature: $temperature',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Weather Conditions: $weather',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ), 
    );
  }
}
