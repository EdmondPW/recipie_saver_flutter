import 'package:flutter/material.dart';
import 'package:recipie_saver_flutter/logic/AuthLogic.dart';
import 'package:recipie_saver_flutter/logic/FirebaseFavoriteRecipeLogic.dart';
import 'package:recipie_saver_flutter/logic/RecipeModel.dart';

import '../../../static/RecipeCard.dart';

class MobileFavoriteWidget extends StatefulWidget {
  const MobileFavoriteWidget({super.key});

  @override
  State<MobileFavoriteWidget> createState() => _MobileFavoriteWidgetState();
}

class _MobileFavoriteWidgetState extends State<MobileFavoriteWidget> {
  List<Results> recipes = [];

  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    List<Results> fetchedRecipes =
        await readDocument('Favorite', AuthLogic().currentUser!.uid.toString());
    setState(() {
      recipes = fetchedRecipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (recipes.isNotEmpty)
            ? Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recipes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0),
                  itemBuilder: (context, index) {
                    return RecipeCard(
                      result: recipes[index],
                    );
                  },
                ),
              )
            : const Text("No Favorite"),
      ],
    );
  }
}
