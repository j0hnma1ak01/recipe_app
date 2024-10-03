import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/cubits/recipe_cubit.dart';
import 'package:recipe_app/cubits/recipe_state.dart';
import 'package:recipe_app/screens/recipe_detail_screen.dart';
//import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/widgets/recipe_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        title: const Text(
          "Recipe App",
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFE23E3E),
              ),
            );
          } else if (state is RecipeError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is RecipeLoaded) {
            return ListView.builder(
                itemCount: state.recipes.length,
                itemBuilder: (context, index) {
                  return RecipeWidget(
                    recipe: state.recipes[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipeDetailScreen(
                                recipe: state.recipes[index])),
                      );
                    },
                  );
                });
          } else {
            return const Center(
                child: Text("ohh sorry!! There is no Recipes Founded"));
          }
        },
      ),
    );
  }
}
