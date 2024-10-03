import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE23E3E),
                Color(0xFFFF6B6B),
                Color(0xFFFF3B3B),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        title: Text(
          recipe.name,
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(recipe.image),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  recipe.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(10.0),
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 9, top: 2, bottom: 2),
                  child: Text(
                    recipe.ingredients.join(',  '),
                    style: const TextStyle(
                      fontSize: 21,
                      color: Color(0xFFE23E3E),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
