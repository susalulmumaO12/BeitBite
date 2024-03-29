class Dish {
  final String name;
  final String ingredients;
  final String description;
  final int numberOfServes;
  final String category;
  final String chefName;
  final String imagePath;

  Dish({
    required this.name,
    required this.ingredients,
    required this.description,
    required this.numberOfServes,
    required this.category,
    required this.chefName,
    required this.imagePath,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      name: json['name'],
      ingredients: json['ingredients'],
      description: json['description'],
      numberOfServes: json['numberOfServes'],
      category: json['category'],
      chefName: json['chefName'],
      imagePath: json['imagePath'],
    );
  }
}
