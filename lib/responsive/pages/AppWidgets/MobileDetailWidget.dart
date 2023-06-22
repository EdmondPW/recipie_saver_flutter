import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipie_saver_flutter/logic/FirebaseFavoriteRecipeLogic.dart';
import 'package:recipie_saver_flutter/static/ColorConfig.dart';

import '../../../logic/AuthLogic.dart';
import '../../../logic/RecipeModel.dart';
import '../../../main.dart';

class MobileDetailWidget extends ConsumerStatefulWidget {
  final Results result;

  const MobileDetailWidget({super.key, required this.result});

  @override
  ConsumerState<MobileDetailWidget> createState() => _MobileDetailWidgetState();
}

class _MobileDetailWidgetState extends ConsumerState<MobileDetailWidget> {
  bool isFavorite = false;

  void checkFavorite(int selectedIndex) {
    if (selectedIndex == 1) {
      setState(() {
        isFavorite = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(indexPageStateProvider);
    checkFavorite(selectedIndex);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color iconColor = AppColors.black;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: isFavorite ? Colors.red[700] : iconColor,
            ),
            onPressed: () async {
              // Add your favorite button functionality here
              if (isFavorite == false) {
                await addRecipeToFavorite(widget.result);
                setState(() {
                  isFavorite = !isFavorite;
                });
              } else {
                deleteDocument(
                    'Favorite',
                    AuthLogic().currentUser!.uid.toString(),
                    'recipe${widget.result.id}');
                ref
                    .read(FavoritetateProvider.notifier)
                    .update((state) => !state);
                setState(() {
                  isFavorite = !isFavorite;
                });
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                width: double.infinity,
                height: 250,
                child: Image.network(
                  widget.result.thumbnailUrl.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: Center(
                    child: Text(
                  widget.result.name.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainColor,
                    ),
                    width: width * 0.3,
                    height: 100,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Number of serving',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text('${widget.result.numServings}'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainColor,
                    ),
                    width: width * 0.3,
                    height: 100,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Time needed',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text('${widget.result.cookTimeMinutes ?? "no data"}')
                      ],
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainColor,
                    ),
                    width: width * 0.3,
                    height: 100,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Score',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text('${widget.result.userRatings?.score ?? "no data"}')
                      ],
                    )),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                child: Container(
                  width: double.infinity,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.mainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Description:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              widget.result.description.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                child: Container(
                  width: double.infinity,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.mainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Ingredients:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              widget.result.sections![0].getAllIngredients(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10, bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.mainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Instruction:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              widget.result.getAllIstruction(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
