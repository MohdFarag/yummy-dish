import '/flutter_flow/flutter_flow_util.dart';
import 'preperation_step_input_component_widget.dart'
    show PreperationStepInputComponentWidget;
import 'package:flutter/material.dart';

class PreperationStepInputComponentModel
    extends FlutterFlowModel<PreperationStepInputComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PreperationStepTextField widget.
  FocusNode? preperationStepTextFieldFocusNode;
  TextEditingController? preperationStepTextFieldTextController;
  String? Function(BuildContext, String?)?
      preperationStepTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    preperationStepTextFieldFocusNode?.dispose();
    preperationStepTextFieldTextController?.dispose();
  }
}
