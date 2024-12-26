import '/flutter_flow/flutter_flow_util.dart';
import 'ingredient_input_widget.dart' show IngredientInputWidget;
import 'package:flutter/material.dart';

class IngredientInputModel extends FlutterFlowModel<IngredientInputWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for AmountTextField widget.
  FocusNode? amountTextFieldFocusNode;
  TextEditingController? amountTextFieldTextController;
  String? Function(BuildContext, String?)?
      amountTextFieldTextControllerValidator;
  // State field(s) for UnitTextField widget.
  FocusNode? unitTextFieldFocusNode;
  TextEditingController? unitTextFieldTextController;
  String? Function(BuildContext, String?)? unitTextFieldTextControllerValidator;
  // State field(s) for IngredientTextField widget.
  FocusNode? ingredientTextFieldFocusNode;
  TextEditingController? ingredientTextFieldTextController;
  String? Function(BuildContext, String?)?
      ingredientTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    amountTextFieldFocusNode?.dispose();
    amountTextFieldTextController?.dispose();

    unitTextFieldFocusNode?.dispose();
    unitTextFieldTextController?.dispose();

    ingredientTextFieldFocusNode?.dispose();
    ingredientTextFieldTextController?.dispose();
  }
}
