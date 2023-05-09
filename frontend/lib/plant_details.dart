class PlantDetails {
  final String plantNickname;
  final String? moisture;
  final double? brightness;
  final double? temperature;
  final double? humidity;

  const PlantDetails(
      {required this.plantNickname,
      this.brightness,
      this.moisture,
      this.temperature,
      this.humidity});

  factory PlantDetails.fromJson(Map<String, dynamic> json) {
    String moisture;
    switch (json['moisture']) {
      case 'TOO_DRY':
        moisture = 'Too Dry';
        break;
      case 'TOO_WET':
        moisture = 'Too wet';
        break;
      case 'OKAY':
        moisture = 'Okay';
        break;
      default:
        moisture = 'No Data';
    }
    return PlantDetails(
      plantNickname: json['plantNickname'],
      brightness: json['brightness'],
      temperature: json['temperature'],
      humidity: json['humidity'],
      moisture: moisture,
    );
  }

  Map<String, dynamic> toJson() => {
        'plantNickname': plantNickname,
        'brightness': brightness,
        'moisture': moisture,
        'temperature': temperature,
        'humidity': humidity,
      };
}
