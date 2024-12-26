import 'package:collection/collection.dart';

enum RecipeCategory {
  Breakfast,
  Lunch,
  Dinner,
  Snacks,
  Appetizers,
  Desserts,
  Italian,
  Indian,
  Chinese,
  Mexican,
  Thai,
  Mediterranean,
  French,
  Japanese,
  MiddleEastern,
  American,
  Chicken,
  Beef,
  Pork,
  Seafood,
  Pasta,
  Rice,
  Vegetables,
  Fruits,
  Baking,
  Grilling,
  Salads,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (RecipeCategory):
      return RecipeCategory.values.deserialize(value) as T?;
    default:
      return null;
  }
}
