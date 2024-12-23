import '/feed/recipe/recipe_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feed_widget.dart' show FeedWidget;
import 'package:flutter/material.dart';

class FeedModel extends FlutterFlowModel<FeedWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // Models for Recipe dynamic component.
  late FlutterFlowDynamicModels<RecipeModel> recipeModels;

  @override
  void initState(BuildContext context) {
    recipeModels = FlutterFlowDynamicModels(() => RecipeModel());
  }

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    recipeModels.dispose();
  }
}
