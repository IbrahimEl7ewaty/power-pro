class EnergySource {
  final String id;
  final String name;
  final String coverImage;
  final String description;
  final List<String> advantages;
  final List<String> dailyUses;
  final String howItWorksDescription;
  final String howItWorksImage;

  EnergySource({
    required this.id,
    required this.name,
    required this.coverImage,
    required this.description,
    required this.advantages,
    required this.dailyUses,
    required this.howItWorksDescription,
    required this.howItWorksImage,
  });

  factory EnergySource.fromJson(Map<String, dynamic> json) {
    return EnergySource(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      coverImage: json['coverImage'] ?? '',
      description: json['shortDescription'] ?? 'No description available',
      advantages: List<String>.from(json['advantages'] ?? []),
      dailyUses: List<String>.from(json['dailyUses'] ?? []),
      howItWorksDescription:
          json['howItWorks']?['description'] ?? 'No description available',
      howItWorksImage: json['howItWorks']?['diagramImage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id ?? 'no_id_available',
      'name': name ?? 'No name available',
      'coverImage': coverImage ?? '',
      'shortDescription': description ?? 'No description available',
      'advantages': advantages ?? [],
      'dailyUses': dailyUses ?? [],
      'howItWorks': {
        'description': howItWorksDescription ?? 'No description available',
        'diagramImage': howItWorksImage ?? 'No image available',
      },
    };
  }
}
