class Food {
  final int? id;
  final int userId;
  final String foodName;
  final int profit;
  final int productionCost;
  final String description;
  final String foodType;
  final String image;

  Food({
    this.id,
    required this.userId,
    required this.foodName,
    required this.profit,
    required this.productionCost,
    required this.description,
    required this.foodType,
    required this.image,
  });

  factory Food.fromJson(Map<String, dynamic> data) {
    return Food(
      id: data['id'],
      userId: data['userId'],
      foodName: data['foodName'],
      profit: data['profit'],
      productionCost: data['productionCost'],
      description: data['description'],
      foodType: data['foodType'],
      image: data['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userd': userId,
      'foodName': foodName,
      'profit': profit,
      'productionCost': productionCost,
      'description': description,
      'foodType': foodType,
      'image': image,
    };
  }
}
