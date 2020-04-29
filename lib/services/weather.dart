import 'location.dart';
import 'networking.dart';

class WeatherModel {

  Future<dynamic> getCityData(String city) async {
    NetworkingHelper networkingHelper = NetworkingHelper(
      url: 'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=1d640bd5ecdfdac405b989f8eb00ed28');
    var data = await networkingHelper.getData();
    return data;
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getLocation();
    double lat = location.latitude;
    double lon = location.longitude;
    NetworkingHelper networkingHelper = NetworkingHelper(
      url: 'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=1d640bd5ecdfdac405b989f8eb00ed28');
    var data = await networkingHelper.getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
