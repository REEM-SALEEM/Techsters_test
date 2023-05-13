import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techsterstest/festivals/controller/festival_img_prov.dart';
import 'package:techsterstest/festivals/controller/var_prov.dart';
import 'package:techsterstest/weather/controller/variable_prov.dart';
import 'package:techsterstest/weather/controller/weather_prov.dart';
import 'package:techsterstest/weather/views/weather_list_screen.dart';

import 'festivals/controller/festival_prov.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FestivalProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FestivalTwoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VariableProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FestVariableProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WeatherListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
