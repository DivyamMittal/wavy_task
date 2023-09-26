// my model will be containing the city name, tempertaure, wind speed
// humidity etc..

class WeatherModel {
  String? cityName;
  num? temp;
  num? wind;
  num? humidity;
  double? feels_like;

  WeatherModel(
      {this.cityName, this.temp, this.wind, this.humidity, this.feels_like});

  // function to convert from Json to dart model
  WeatherModel.fromJson(Map<String?, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
  }
}
