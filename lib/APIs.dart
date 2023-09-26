// here i will make the function to call weather details from API

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'weather_model.dart';

class APIs {
  Future<WeatherModel> getWeatherdetails(String location) async {
    if (location == "") {
      location = "Safidon,haryana,India";
    }
    final api_key = "15af464f5f876b63847a2e3bde0aad88";
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$api_key");
    var response = await http.get(url);
    var body = jsonDecode(response.body);
    log("weather details : $body");

    // now it will return the details in object
    return WeatherModel.fromJson(body);
  }
}
