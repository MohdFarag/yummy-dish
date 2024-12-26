import '/backend/backend.dart';
import '/components/notification_badge_widget.dart';
import '/feed/recipe_component/recipe_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'feed_widget.dart' show FeedWidget;
import 'package:flutter/material.dart';

class FeedModel extends FlutterFlowModel<FeedWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  ///  State fields for stateful widgets in this page.

  // Model for NotificationBadge component.
  late NotificationBadgeModel notificationBadgeModel;
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  List<RecipesRecord> simpleSearchResults = [];
  Completer<List<RecipesRecord>>? firestoreRequestCompleter;
  // Models for RecipeComponent dynamic component.
  late FlutterFlowDynamicModels<RecipeComponentModel> recipeComponentModels1;
  // Models for RecipeComponent dynamic component.
  late FlutterFlowDynamicModels<RecipeComponentModel> recipeComponentModels2;

  @override
  void initState(BuildContext context) {
    notificationBadgeModel =
        createModel(context, () => NotificationBadgeModel());
    recipeComponentModels1 =
        FlutterFlowDynamicModels(() => RecipeComponentModel());
    recipeComponentModels2 =
        FlutterFlowDynamicModels(() => RecipeComponentModel());
  }

  @override
  void dispose() {
    notificationBadgeModel.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    recipeComponentModels1.dispose();
    recipeComponentModels2.dispose();
  }

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
