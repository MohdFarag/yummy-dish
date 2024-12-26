import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/recipe/view/comment_component/comment_component_widget.dart';
import '/recipe/view/ingradient_component/ingradient_component_widget.dart';
import '/recipe/view/rating_bar_component/rating_bar_component_widget.dart';
import '/recipe/view/step_component/step_component_widget.dart';
import 'view_recipe_widget.dart' show ViewRecipeWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ViewRecipeModel extends FlutterFlowModel<ViewRecipeWidget> {
  ///  Local state fields for this page.

  bool? isLiked;

  bool? isFavourite;

  ///  State fields for stateful widgets in this page.

  // Models for IngradientComponent dynamic component.
  late FlutterFlowDynamicModels<IngradientComponentModel>
      ingradientComponentModels;
  // Models for StepComponent dynamic component.
  late FlutterFlowDynamicModels<StepComponentModel> stepComponentModels;
  // Model for RatingBarComponent component.
  late RatingBarComponentModel ratingBarComponentModel1;
  // Model for RatingBarComponent component.
  late RatingBarComponentModel ratingBarComponentModel2;
  // State field(s) for CommentsList widget.

  PagingController<DocumentSnapshot?, CommentsRecord>?
      commentsListPagingController;
  Query? commentsListPagingQuery;
  List<StreamSubscription?> commentsListStreamSubscriptions = [];

  // Models for CommentComponent dynamic component.
  late FlutterFlowDynamicModels<CommentComponentModel> commentComponentModels;

  @override
  void initState(BuildContext context) {
    ingradientComponentModels =
        FlutterFlowDynamicModels(() => IngradientComponentModel());
    stepComponentModels = FlutterFlowDynamicModels(() => StepComponentModel());
    ratingBarComponentModel1 =
        createModel(context, () => RatingBarComponentModel());
    ratingBarComponentModel2 =
        createModel(context, () => RatingBarComponentModel());
    commentComponentModels =
        FlutterFlowDynamicModels(() => CommentComponentModel());
  }

  @override
  void dispose() {
    ingradientComponentModels.dispose();
    stepComponentModels.dispose();
    ratingBarComponentModel1.dispose();
    ratingBarComponentModel2.dispose();
    for (var s in commentsListStreamSubscriptions) {
      s?.cancel();
    }
    commentsListPagingController?.dispose();

    commentComponentModels.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, CommentsRecord> setCommentsListController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    commentsListPagingController ??=
        _createCommentsListController(query, parent);
    if (commentsListPagingQuery != query) {
      commentsListPagingQuery = query;
      commentsListPagingController?.refresh();
    }
    return commentsListPagingController!;
  }

  PagingController<DocumentSnapshot?, CommentsRecord>
      _createCommentsListController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, CommentsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCommentsRecordPage(
          parent: parent,
          queryBuilder: (_) => commentsListPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: commentsListStreamSubscriptions,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
