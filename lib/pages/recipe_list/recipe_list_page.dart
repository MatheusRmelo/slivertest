import 'package:flutter/material.dart';
import 'package:slivertest/pages/recipe_list/widgets/recipe_item_widget.dart';

import '../../constants/app_image_paths.dart';
import '../../repositories/recipe_repository.dart';
import '../../widgets/app_bar_widget.dart';
import 'widgets/footer_widget.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipes = RecipeRepository.getRecipes();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(
            text: 'Reciperlich',
            imagePath: AppImagePaths.mainImage,
            centerTitle: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverFixedExtentList(
              itemExtent: 110,
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: RecipeItem(recipe: recipes[index]),
                      ),
                  childCount: recipes.length),
            ),
          ),
          const SliverToBoxAdapter(
            child: FooterWidget(),
          ),
        ],
      ),
    );
  }
}
