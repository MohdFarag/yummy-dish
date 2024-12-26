import '/feed/recipe_component/recipe_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_favourites_widget.dart' show UserFavouritesWidget;
import 'package:flutter/material.dart';

class UserFavouritesModel extends FlutterFlowModel<UserFavouritesWidget> {
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
