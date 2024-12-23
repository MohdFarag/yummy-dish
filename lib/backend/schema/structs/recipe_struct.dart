// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RecipeStruct extends FFFirebaseStruct {
  RecipeStruct({
    int? id,
    String? title,
    String? description,
    double? rating,
    int? numberOfLikes,
    int? numberOfComments,
    String? imagePath,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _description = description,
        _rating = rating,
        _numberOfLikes = numberOfLikes,
        _numberOfComments = numberOfComments,
        _imagePath = imagePath,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  set rating(double? val) => _rating = val;

  void incrementRating(double amount) => rating = rating + amount;

  bool hasRating() => _rating != null;

  // "numberOfLikes" field.
  int? _numberOfLikes;
  int get numberOfLikes => _numberOfLikes ?? 0;
  set numberOfLikes(int? val) => _numberOfLikes = val;

  void incrementNumberOfLikes(int amount) =>
      numberOfLikes = numberOfLikes + amount;

  bool hasNumberOfLikes() => _numberOfLikes != null;

  // "numberOfComments" field.
  int? _numberOfComments;
  int get numberOfComments => _numberOfComments ?? 0;
  set numberOfComments(int? val) => _numberOfComments = val;

  void incrementNumberOfComments(int amount) =>
      numberOfComments = numberOfComments + amount;

  bool hasNumberOfComments() => _numberOfComments != null;

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  set imagePath(String? val) => _imagePath = val;

  bool hasImagePath() => _imagePath != null;

  static RecipeStruct fromMap(Map<String, dynamic> data) => RecipeStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        description: data['description'] as String?,
        rating: castToType<double>(data['rating']),
        numberOfLikes: castToType<int>(data['numberOfLikes']),
        numberOfComments: castToType<int>(data['numberOfComments']),
        imagePath: data['imagePath'] as String?,
      );

  static RecipeStruct? maybeFromMap(dynamic data) =>
      data is Map ? RecipeStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'description': _description,
        'rating': _rating,
        'numberOfLikes': _numberOfLikes,
        'numberOfComments': _numberOfComments,
        'imagePath': _imagePath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.double,
        ),
        'numberOfLikes': serializeParam(
          _numberOfLikes,
          ParamType.int,
        ),
        'numberOfComments': serializeParam(
          _numberOfComments,
          ParamType.int,
        ),
        'imagePath': serializeParam(
          _imagePath,
          ParamType.String,
        ),
      }.withoutNulls;

  static RecipeStruct fromSerializableMap(Map<String, dynamic> data) =>
      RecipeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.double,
          false,
        ),
        numberOfLikes: deserializeParam(
          data['numberOfLikes'],
          ParamType.int,
          false,
        ),
        numberOfComments: deserializeParam(
          data['numberOfComments'],
          ParamType.int,
          false,
        ),
        imagePath: deserializeParam(
          data['imagePath'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RecipeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RecipeStruct &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        rating == other.rating &&
        numberOfLikes == other.numberOfLikes &&
        numberOfComments == other.numberOfComments &&
        imagePath == other.imagePath;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        title,
        description,
        rating,
        numberOfLikes,
        numberOfComments,
        imagePath
      ]);
}

RecipeStruct createRecipeStruct({
  int? id,
  String? title,
  String? description,
  double? rating,
  int? numberOfLikes,
  int? numberOfComments,
  String? imagePath,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RecipeStruct(
      id: id,
      title: title,
      description: description,
      rating: rating,
      numberOfLikes: numberOfLikes,
      numberOfComments: numberOfComments,
      imagePath: imagePath,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RecipeStruct? updateRecipeStruct(
  RecipeStruct? recipe, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    recipe
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRecipeStructData(
  Map<String, dynamic> firestoreData,
  RecipeStruct? recipe,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (recipe == null) {
    return;
  }
  if (recipe.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && recipe.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final recipeData = getRecipeFirestoreData(recipe, forFieldValue);
  final nestedData = recipeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = recipe.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRecipeFirestoreData(
  RecipeStruct? recipe, [
  bool forFieldValue = false,
]) {
  if (recipe == null) {
    return {};
  }
  final firestoreData = mapToFirestore(recipe.toMap());

  // Add any Firestore field values
  recipe.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRecipeListFirestoreData(
  List<RecipeStruct>? recipes,
) =>
    recipes?.map((e) => getRecipeFirestoreData(e, true)).toList() ?? [];
