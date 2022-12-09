class SavedLocationModel {
  int id;
  String name;
  String? description;
  double lat;
  double lng;

  SavedLocationModel(
      {required this.name,
      required this.id,
      this.description,
      required this.lat,
      required this.lng});

  factory SavedLocationModel.fromJson(Map<String, dynamic> json) {
    return SavedLocationModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        lat: json["lat"],
        lng: json["lng"]);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "id": id,
      "name": name,
      "description": description,
      "lat": lat,
      "lng": lng,
    };
  }

  SavedLocationModel copyWith({
    int? id,
    String? name,
    String? description,
    double? lat,
    double? lng,
  }) =>
      SavedLocationModel(
          name: name ?? this.name,
          id: id ?? this.id,
          description: description ?? this.description,
          lat: lat ?? this.lat,
          lng: lng ?? this.lng);
}
