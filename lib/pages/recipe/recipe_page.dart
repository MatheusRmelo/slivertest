import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../models/recipe_model.dart';

class RecipePage extends StatelessWidget {
  final RecipeModel recipe;
  const RecipePage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(recipe.instructions, style: const TextStyle(color: AppColors.navy, fontSize: 18))),
          )
        ],
      ),
    );
  }
}
