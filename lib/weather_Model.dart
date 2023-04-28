class WeatherModel {
  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'assets/storm.png';
    } else if (condition < 400) {
      return 'assets/raining.png';
    } else if (condition < 600) {
      return 'assets/umbrella.png';
    } else if (condition < 700) {
      return 'assets/snowman.png';
    } else if (condition < 800) {
      return 'assets/wind.png';
    } else if (condition == 800) {
      return 'assets/sun.png';
    } else if (condition <= 804) {
      return 'assets/cloudy.png';
    } else {
      return 'assets/weather-app.png';
    }
  }

  static String getMessage(int temp) {
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
