import '/feed/recipe_component/recipe_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_recipes_widget.dart' show UserRecipesWidget;
import 'package:flutter/material.dart';

class UserRecipesModel extends FlutterFlowModel<UserRecipesWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  ///  State fields for stateful widgets in this page.

  // Models for RecipeComponent dynamic component.
  late FlutterFlowDynamicModels<RecipeComponentModel> recipeComponentModels;

  @override
  void initState(BuildContext context) {
    recipeComponentModels =
        FlutterFlowDynamicModels(() => RecipeComponentModel());
  }

  @override
  void dispose() {
    recipeComponentModels.dispose();
  }
}
