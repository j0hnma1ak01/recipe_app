import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/cubits/recipe_state.dart';
import 'package:recipe_app/services/recipe_service.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeInitial()) {
    getRecipes();
  }

  final _service = RecipeService();

  void getRecipes() async {
    emit(RecipeLoading());
    try {
      final result = await _service.getRecipes();
      emit(RecipeLoaded(recipes: result));
    } catch (e) {
      emit(RecipeError(message: e.toString()));
    }
  }
}
