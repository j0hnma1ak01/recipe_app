// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      name: json['name'] as String,
      image: json['image'] as String,
      rating: (json['rating'] as num).toDouble(),
      caloriesPerServing: (json['caloriesPerServing'] as num).toInt(),
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
