import 'package:flutter/material.dart';
import 'package:recipie_saver_flutter/logic/FetchRecipeLogic.dart';
import 'package:recipie_saver_flutter/logic/RecipeModel.dart';
import 'package:recipie_saver_flutter/static/ColorConfig.dart';
import 'package:recipie_saver_flutter/static/RecipeCard.dart';

class MobileHomeWidget extends StatefulWidget {
  const MobileHomeWidget({super.key});

  @override
  State<MobileHomeWidget> createState() => _MobileHomeWidgetState();
}

class _MobileHomeWidgetState extends State<MobileHomeWidget> {
  Recipes recipes = Recipes(count: 0);

  @override
  Widget build(BuildContext context) {
    final search = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: TextField(
            controller: search,
            decoration: const InputDecoration(
              hintText: "Food name...",
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
          child: SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColors.black)),
                onPressed: () async {
                  print("Start search");
                  recipes = await fetchFood(recipes, search.text);
                  setState(() {});
                },
                child: const Text("Search")),
          ),
        ),
        (recipes.count! > 0)
            ? Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recipes.results!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0),
                  itemBuilder: (context, index) {
                    return RecipeCard(
                      result: recipes.results![index],
                    );
                  },
                ),
              )
            : const Text("No data"),
      ],
    );
  }
}
