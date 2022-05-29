import 'package:flutter/material.dart';
import 'package:slivertest/pages/recipe/widgets/pill_widget.dart';

import '../../constants/colors.dart';
import '../../models/recipe_model.dart';
import '../../widgets/app_bar_widget.dart';
import 'widgets/sliver_sub_header.dart';

class RecipePage extends StatelessWidget {
  final RecipeModel recipe;
  const RecipePage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarWidget(
            text: recipe.title,
            imagePath: recipe.mainImagePath,
          ),
          SliverSubHeader(
            text: 'Instruction',
            backgroundColor: recipe.itemColor,
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(recipe.instructions,
                    style:
                        const TextStyle(color: AppColors.navy, fontSize: 18))),
          ),
          SliverSubHeader(
            text: 'Ingredients',
            backgroundColor: recipe.itemColor,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(15),
            sliver: SliverGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              childAspectRatio: 3,
              children: recipe.ingredients.map((e) => PillWidget(e)).toList(),
            ),
          ),
          SliverSubHeader(
            text: 'Numbers',
            backgroundColor: recipe.itemColor,
          ),
          SliverPadding(
            padding: EdgeInsets.all(15),
            sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PillWidget(recipe.details[index]),
                  childCount: recipe.details.length,
                )),
          ),
          SliverFillRemaining(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
