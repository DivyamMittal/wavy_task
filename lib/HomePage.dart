// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wavy_task/APIs.dart';
import 'package:wavy_task/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  APIs api = new APIs();
  WeatherModel? data;

  @override
  void initState() {
    super.initState();
    getData("Safidon,Haryana,India");
  }

  // data is coming using future so we need to use Future builder to show our data
  // i will use future builder and put the data into our model

  Future<void> getData(String location) async {
    data = await api.getWeatherdetails(location);
    setState(() {});
  }

  double convertFarenToCel(double? F) {
    double cel = (F! - 32) * 5 / 9;
    return double.parse(cel.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    final locationController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // text field to input the location
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                controller: locationController,
                leading: Icon(CupertinoIcons.search),
                hintText: "Search location",
                trailing: [
                  InkWell(
                      onTap: () {
                        getData(locationController.text);
                      },
                      child: Icon(Icons.refresh)),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset(
                    "assets/images/weather-icon.png",
                  )),
            ),

            // temperature
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                data != null
                    ? Text(
                        data!.temp.toString(),
                        style: TextStyle(fontSize: 40),
                      )
                    : Container(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "C",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            data != null
                ? Text(
                    data!.cityName.toString(),
                    style: TextStyle(fontSize: 20),
                  )
                : Container(),

            // city
            // FutureBuilder(
            //     future: getData(locationController.text),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done) {
            //         return Text(
            //           data!.cityName.toString(),
            //           style: TextStyle(fontSize: 20),
            //         );
            //       } else {
            //         return CircularProgressIndicator();
            //       }
            //     }),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Humidity",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    data != null
                        ? Text(
                            data!.humidity.toString(),
                            style: TextStyle(fontSize: 20),
                          )
                        : Container(),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Wind Speed",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    data != null
                        ? Text(
                            data!.wind.toString(),
                            style: TextStyle(fontSize: 20),
                          )
                        : Container(),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Feels like",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    data != null
                        ? Text(
                            data!.feels_like.toString(),
                            style: TextStyle(fontSize: 20),
                          )
                        : Container(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
