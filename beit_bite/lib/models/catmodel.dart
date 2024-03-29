class categoryModel {
  final String name;
  final String id;
  final String imagePath;

  categoryModel(
      {required this.id, required this.name, required this.imagePath});

  factory categoryModel.fromJson(Map<String, dynamic> json) {
    return categoryModel(
        id: json['id'], name: json['name'], imagePath: json['imagePath']);
  }
}
