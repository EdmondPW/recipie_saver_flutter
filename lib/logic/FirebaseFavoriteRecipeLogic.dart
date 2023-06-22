import 'package:recipie_saver_flutter/logic/AuthLogic.dart';
import 'package:recipie_saver_flutter/logic/RecipeModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addRecipeToFavorite(Results repice) {
  var user;
  if (AuthLogic().currentUser == null) {
    throw Exception('Must be logged in');
  }
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final data = repice.toJson();
  user = AuthLogic().currentUser?.uid;
  CollectionReference collectionRef = firestore.collection('Favorite');

  DocumentReference docRef = collectionRef.doc(user);

  return docRef.set({
    'recipe${repice.id}': {'idData': repice.id, 'data': data}
  }, SetOptions(merge: true)).then((value) {
    print('New document created successfully.');
  }).catchError((error) {
    print('Failed to create a new document: $error');
  });
}

Future<List<Results>> readDocument(
    String collectionName, String documentId) async {
  print('document id: $documentId');
  List<Results> recipes = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  DocumentReference docRef =
      firestore.collection(collectionName).doc(documentId);

  try {
    DocumentSnapshot snapshot = await docRef.get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      List<MapEntry<String, dynamic>> listData = data.entries.toList();
      for (var recipe in listData) {
        dynamic value = recipe.value;

        if (value is Map<String, dynamic>) {
          // Handle nested JSON object
          Map<String, dynamic> nestedRecipe = value;

          Results temp = Results.fromJson(nestedRecipe['data']);
          print('Document data: $temp \n');
          recipes.add(temp);
          print('Document data: ${recipes.length} \n');
        }
      }
    } else {
      print('Document does not exist');
    }
  } catch (error) {
    print('Failed to read document: $error');
  }

  return recipes;
}

bool deleteDocument(
    String collectionName, String documentId, String fieldName) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  bool result = false;
  DocumentReference docRef =
      firestore.collection(collectionName).doc(documentId);

  docRef.update({
    fieldName: FieldValue.delete(),
  }).then((_) {
    result = true;
    print('Field deleted successfully');
  }).catchError((error) {
    print('Failed to delete field: $error');
  });
  return result;
}
