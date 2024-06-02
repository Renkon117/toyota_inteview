class Car {
  String id;
  String title;
  String subtitle;
  String description;
  String type;
  String color;
  bool isFavorite;
  List<String> images;

  Car({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.type,
    required this.color,
    required this.isFavorite,
    required this.images,
  });

  @override
  String toString() {
    return 'Car(id: $id, title: $title, subtitle: $subtitle, description: $description, type: $type, color: $color, isFavorite: $isFavorite, images: $images)';
  }
}
