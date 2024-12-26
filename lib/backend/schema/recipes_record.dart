import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecipesRecord extends FirestoreRecord {
  RecipesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "poster" field.
  DocumentReference? _poster;
  DocumentReference? get poster => _poster;
  bool hasPoster() => _poster != null;

  // "likers" field.
  List<DocumentReference>? _likers;
  List<DocumentReference> get likers => _likers ?? const [];
  bool hasLikers() => _likers != null;

  // "image_path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "short_description" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "ingredients" field.
  List<DocumentReference>? _ingredients;
  List<DocumentReference> get ingredients => _ingredients ?? const [];
  bool hasIngredients() => _ingredients != null;

  // "steps" field.
  List<String>? _steps;
  List<String> get steps => _steps ?? const [];
  bool hasSteps() => _steps != null;

  // "comments" field.
  List<DocumentReference>? _comments;
  List<DocumentReference> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "ratings" field.
  List<DocumentReference>? _ratings;
  List<DocumentReference> get ratings => _ratings ?? const [];
  bool hasRatings() => _ratings != null;

  // "avg_rating" field.
  double? _avgRating;
  double get avgRating => _avgRating ?? 0.0;
  bool hasAvgRating() => _avgRating != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _poster = snapshotData['poster'] as DocumentReference?;
    _likers = getDataList(snapshotData['likers']);
    _imagePath = snapshotData['image_path'] as String?;
    _shortDescription = snapshotData['short_description'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _ingredients = getDataList(snapshotData['ingredients']);
    _steps = getDataList(snapshotData['steps']);
    _comments = getDataList(snapshotData['comments']);
    _ratings = getDataList(snapshotData['ratings']);
    _avgRating = castToType<double>(snapshotData['avg_rating']);
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecipesRecord.fromSnapshot(s));

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecipesRecord.fromSnapshot(s));

  static RecipesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecipesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecipesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecipesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecipesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecipesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecipesRecordData({
  String? title,
  DocumentReference? poster,
  String? imagePath,
  String? shortDescription,
  DateTime? createdTime,
  double? avgRating,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'poster': poster,
      'image_path': imagePath,
      'short_description': shortDescription,
      'created_time': createdTime,
      'avg_rating': avgRating,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecipesRecordDocumentEquality implements Equality<RecipesRecord> {
  const RecipesRecordDocumentEquality();

  @override
  bool equals(RecipesRecord? e1, RecipesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.poster == e2?.poster &&
        listEquality.equals(e1?.likers, e2?.likers) &&
        e1?.imagePath == e2?.imagePath &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.ingredients, e2?.ingredients) &&
        listEquality.equals(e1?.steps, e2?.steps) &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        listEquality.equals(e1?.ratings, e2?.ratings) &&
        e1?.avgRating == e2?.avgRating &&
        e1?.category == e2?.category;
  }

  @override
  int hash(RecipesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.poster,
        e?.likers,
        e?.imagePath,
        e?.shortDescription,
        e?.createdTime,
        e?.ingredients,
        e?.steps,
        e?.comments,
        e?.ratings,
        e?.avgRating,
        e?.category
      ]);

  @override
  bool isValidKey(Object? o) => o is RecipesRecord;
}
