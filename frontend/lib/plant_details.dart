class PlantDetails {
  final int soilMoisture;
  final int roomTemperature;
  final int roomHumidity;
  final double light;

  const PlantDetails({
    required this.soilMoisture,
    required this.roomTemperature,
    required this.roomHumidity,
    required this.light,
  });

  factory PlantDetails.fromJson(Map<String, dynamic> json) => PlantDetails(
        soilMoisture: json['soilMoisture'],
        roomTemperature: json['roomTemperature'],
        roomHumidity: json['roomHumidity'],
        light: json['light'],
      );

  Map<String, dynamic> toJson() => {
        'soilMoisture': soilMoisture,
        'roomTemperature': roomTemperature,
        'roomHumidity': roomHumidity,
        'light': light,
      };
}
