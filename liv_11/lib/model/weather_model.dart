class WeatherData {
  final String? city;
  final int? temperature;
  final String? condition;
  final int? humidity;
  final double? windSpeed;

  WeatherData({this.city, this.temperature,
   this.condition, 
   this.humidity, 
   this.windSpeed});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      city: json['city'],
      temperature: json['temperature'],
      condition: json['condition'],
      humidity: json['humidity'],
      windSpeed: json['windSpeed'].toDouble(),
    );
  }
}
 