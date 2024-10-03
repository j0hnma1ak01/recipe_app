import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class Recipe {
  final String name;
  final String image;
  final double rating;
  final int caloriesPerServing;
  final List<String> ingredients;

  Recipe(
      {required this.name,
      required this.image,
      required this.rating,
      required this.caloriesPerServing,
      required this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
