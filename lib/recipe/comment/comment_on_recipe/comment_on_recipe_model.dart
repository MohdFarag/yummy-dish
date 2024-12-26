import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comment_on_recipe_widget.dart' show CommentOnRecipeWidget;
import 'package:flutter/material.dart';

class CommentOnRecipeModel extends FlutterFlowModel<CommentOnRecipeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CommentsRecord? newComment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
