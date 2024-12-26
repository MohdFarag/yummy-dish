import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/recipe/create/image_picker_component/image_picker_component_widget.dart';
import '/recipe/create/ingredient_input/ingredient_input_widget.dart';
import '/recipe/create/preperation_step_input_component/preperation_step_input_component_widget.dart';
import 'create_recipe_widget.dart' show CreateRecipeWidget;
import 'package:flutter/material.dart';

class CreateRecipeModel extends FlutterFlowModel<CreateRecipeWidget> {
  ///  Local state fields for this page.

  List<IngredientsRecord> ingredientsList = [];
  void addToIngredientsList(IngredientsRecord item) =>
      ingredientsList.add(item);
  void removeFromIngredientsList(IngredientsRecord item) =>
      ingredientsList.remove(item);
  void removeAtIndexFromIngredientsList(int index) =>
      ingredientsList.removeAt(index);
  void insertAtIndexInIngredientsList(int index, IngredientsRecord item) =>
      ingredientsList.insert(index, item);
  void updateIngredientsListAtIndex(
          int index, Function(IngredientsRecord) updateFn) =>
      ingredientsList[index] = updateFn(ingredientsList[index]);

  List<String> preperationStepsList = [];
  void addToPreperationStepsList(String item) => preperationStepsList.add(item);
  void removeFromPreperationStepsList(String item) =>
      preperationStepsList.remove(item);
  void removeAtIndexFromPreperationStepsList(int index) =>
      preperationStepsList.removeAt(index);
  void insertAtIndexInPreperationStepsList(int index, String item) =>
      preperationStepsList.insert(index, item);
  void updatePreperationStepsListAtIndex(
          int index, Function(String) updateFn) =>
      preperationStepsList[index] = updateFn(preperationStepsList[index]);

  DocumentReference? newRecipeRef;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Create Document] action in CreateRecipe widget.
  RecipesRecord? newRecipe;
  // State field(s) for RecipeTitleTextField widget.
  FocusNode? recipeTitleTextFieldFocusNode;
  TextEditingController? recipeTitleTextFieldTextController;
  String? Function(BuildContext, String?)?
      recipeTitleTextFieldTextControllerValidator;
  String? _recipeTitleTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qjwqmq21' /* Recipe Title is required */,
      );
    }

    if (val.length < 3) {
      return FFLocalizations.of(context).getText(
        'i54cswx5' /* Minimum required characters is... */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for ShortDescriptionTextField widget.
  FocusNode? shortDescriptionTextFieldFocusNode;
  TextEditingController? shortDescriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      shortDescriptionTextFieldTextControllerValidator;
  String? _shortDescriptionTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ou0o5zjt' /* Short Description is required */,
      );
    }

    return null;
  }

  // State field(s) for CategoryDropDown widget.
  String? categoryDropDownValue;
  FormFieldController<String>? categoryDropDownValueController;
  // Model for ImagePickerComponent component.
  late ImagePickerComponentModel imagePickerComponentModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Models for IngredientInput dynamic component.
  late FlutterFlowDynamicModels<IngredientInputModel> ingredientInputModels;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  IngredientsRecord? newIngredient;
  // Models for PreperationStepInputComponent dynamic component.
  late FlutterFlowDynamicModels<PreperationStepInputComponentModel>
      preperationStepInputComponentModels;

  @override
  void initState(BuildContext context) {
    recipeTitleTextFieldTextControllerValidator =
        _recipeTitleTextFieldTextControllerValidator;
    shortDescriptionTextFieldTextControllerValidator =
        _shortDescriptionTextFieldTextControllerValidator;
    imagePickerComponentModel =
        createModel(context, () => ImagePickerComponentModel());
    ingredientInputModels =
        FlutterFlowDynamicModels(() => IngredientInputModel());
    preperationStepInputComponentModels =
        FlutterFlowDynamicModels(() => PreperationStepInputComponentModel());
  }

  @override
  void dispose() {
    recipeTitleTextFieldFocusNode?.dispose();
    recipeTitleTextFieldTextController?.dispose();

    shortDescriptionTextFieldFocusNode?.dispose();
    shortDescriptionTextFieldTextController?.dispose();

    imagePickerComponentModel.dispose();
    ingredientInputModels.dispose();
    preperationStepInputComponentModels.dispose();
  }
}
