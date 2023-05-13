import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:techsterstest/festivals/views/festival_image_list_screen.dart';
import 'package:techsterstest/weather/controller/variable_prov.dart';
import 'package:techsterstest/weather/controller/weather_prov.dart';

class WeatherListScreen extends StatelessWidget {
  const WeatherListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal,
            centerTitle: true,
            title: const Text('Weather Details'),
            automaticallyImplyLeading: true,
            actions: const [
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.sort),
              )
            ]),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer2<VariableProvider, WeatherProvider>(
            builder: (BuildContext context, value, data, Widget? child) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Check City Weather',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 60,
                      child: ListView.separated(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            value.getname(value.city[index]);
                            data.callGetUserList(
                                value.lat[index], value.long[index]);
                          },
                          child: Container(
                            width: 115,
                            decoration: const BoxDecoration(
                                color: Colors.teal,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            margin: const EdgeInsets.only(right: 10),
                            child: Center(
                              child: Text(
                                value.city[index],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(width: 0),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          size: 40,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          value.name,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(children: [
                      Container(
                          height: 100,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                              ],
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                'assets/weather-svgrepo-com.svg',
                                height: 60,
                              ),
                              data.weatherlist == null
                                  ? const Center(
                                      child: Text(
                                      'Temperature:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ))
                                  : Text(
                                      'Temperature: ${data.weatherlist['current_weather']['temperature']}°C'
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                            ],
                          )),
                      const SizedBox(height: 30),
                      Container(
                          height: 100,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                              ],
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                'assets/wind-svg-svgrepo-com.svg',
                                height: 60,
                              ),
                              data.weatherlist == null
                                  ? const Center(
                                      child: Text(
                                      'Windspeed:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ))
                                  : Text(
                                      'Windspeed: ${data.weatherlist['current_weather']['windspeed']}m/s'
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                            ],
                          )),
                      const SizedBox(height: 30),
                      Container(
                        height: 100,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                            ],
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                'assets/wind-sign-wind-svgrepo-com.svg',
                                height: 60,
                              ),
                              data.weatherlist == null
                                  ? const Center(
                                      child: Text(
                                      'Winddirection:',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ))
                                  : Text(
                                      'Winddirection: ${data.weatherlist['current_weather']['winddirection']}'
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )
                            ]),
                      ),
                    ]),
                  ]);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ScreenImages(),
            ));
          },
          backgroundColor: Colors.teal,
          label: const Text('Next Screen'),
          icon: const Icon(Icons.next_plan_outlined),
        ));
  }
}
