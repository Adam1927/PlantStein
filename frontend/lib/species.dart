class Species {
  final int id;
  final String name;
  final String country;

  const Species({
    required this.id,
    required this.name,
    required this.country,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        id: json['id'],
        name: json['name'],
        country: json['country'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': name,
        'country': country,
      };
}
