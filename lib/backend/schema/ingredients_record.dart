import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IngredientsRecord extends FirestoreRecord {
  IngredientsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "ingredient" field.
  String? _ingredient;
  String get ingredient => _ingredient ?? '';
  bool hasIngredient() => _ingredient != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _quantity = castToType<double>(snapshotData['quantity']);
    _ingredient = snapshotData['ingredient'] as String?;
    _unit = snapshotData['unit'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ingredients')
          : FirebaseFirestore.instance.collectionGroup('ingredients');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ingredients').doc(id);

  static Stream<IngredientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IngredientsRecord.fromSnapshot(s));

  static Future<IngredientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IngredientsRecord.fromSnapshot(s));

  static IngredientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IngredientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IngredientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IngredientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IngredientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IngredientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIngredientsRecordData({
  double? quantity,
  String? ingredient,
  String? unit,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quantity': quantity,
      'ingredient': ingredient,
      'unit': unit,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class IngredientsRecordDocumentEquality implements Equality<IngredientsRecord> {
  const IngredientsRecordDocumentEquality();

  @override
  bool equals(IngredientsRecord? e1, IngredientsRecord? e2) {
    return e1?.quantity == e2?.quantity &&
        e1?.ingredient == e2?.ingredient &&
        e1?.unit == e2?.unit &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(IngredientsRecord? e) => const ListEquality()
      .hash([e?.quantity, e?.ingredient, e?.unit, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is IngredientsRecord;
}
