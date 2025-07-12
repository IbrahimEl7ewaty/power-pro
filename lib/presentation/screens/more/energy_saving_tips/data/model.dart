class EnergyTips {
  final String id;
  final String name;
  final String image;

  EnergyTips({required this.id, required this.name, required this.image});

  factory EnergyTips.fromJson(Map<String, dynamic> json) {
    return EnergyTips(
      id: json['_id'], // تأكد من أن الـ JSON يحتوي على _id
      name: json['title'],
      image: json['image'],
    );
  }
}
