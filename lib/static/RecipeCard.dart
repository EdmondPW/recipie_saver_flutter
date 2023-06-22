import 'package:flutter/material.dart';
import 'package:recipie_saver_flutter/logic/RecipeModel.dart';
import 'package:recipie_saver_flutter/static/ColorConfig.dart';

import '../responsive/pages/AppWidgets/MobileDetailWidget.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.result});

  final Results result;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MobileDetailWidget(
                    result: result,
                  )),
        );
      },
      child: Card(
        elevation: 10,
        color: AppColors.mainColor,
        child: SizedBox(
          width: 100,
          height: 100,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.network(
                  result.thumbnailUrl.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.3),
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      result.name.toString(),
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12.0),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
