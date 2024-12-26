import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ingredient_input_model.dart';
export 'ingredient_input_model.dart';

class IngredientInputWidget extends StatefulWidget {
  const IngredientInputWidget({
    super.key,
    required this.ingredient,
  });

  final IngredientsRecord? ingredient;

  @override
  State<IngredientInputWidget> createState() => _IngredientInputWidgetState();
}

class _IngredientInputWidgetState extends State<IngredientInputWidget> {
  late IngredientInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IngredientInputModel());

    _model.amountTextFieldTextController ??=
        TextEditingController(text: widget.ingredient?.quantity.toString());
    _model.amountTextFieldFocusNode ??= FocusNode();

    _model.unitTextFieldTextController ??=
        TextEditingController(text: widget.ingredient?.unit);
    _model.unitTextFieldFocusNode ??= FocusNode();

    _model.ingredientTextFieldTextController ??=
        TextEditingController(text: widget.ingredient?.ingredient);
    _model.ingredientTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: _model.amountTextFieldTextController,
            focusNode: _model.amountTextFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.amountTextFieldTextController',
              const Duration(milliseconds: 2000),
              () async {
                await widget.ingredient!.reference
                    .update(createIngredientsRecordData(
                  quantity: double.tryParse(
                      _model.amountTextFieldTextController.text),
                ));
              },
            ),
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              labelText: FFLocalizations.of(context).getText(
                '0szxn964' /* Amount */,
              ),
              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).primaryBackground,
            ),
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodySmallFamily),
                ),
            maxLines: null,
            keyboardType: TextInputType.number,
            validator: _model.amountTextFieldTextControllerValidator
                .asValidator(context),
          ),
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: _model.unitTextFieldTextController,
            focusNode: _model.unitTextFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.unitTextFieldTextController',
              const Duration(milliseconds: 2000),
              () async {
                await widget.ingredient!.reference
                    .update(createIngredientsRecordData(
                  unit: _model.unitTextFieldTextController.text,
                ));
              },
            ),
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              labelText: FFLocalizations.of(context).getText(
                'q728t1e2' /* Unit */,
              ),
              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).primaryBackground,
            ),
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodySmallFamily),
                ),
            maxLines: null,
            validator: _model.unitTextFieldTextControllerValidator
                .asValidator(context),
          ),
        ),
        Expanded(
          flex: 4,
          child: TextFormField(
            controller: _model.ingredientTextFieldTextController,
            focusNode: _model.ingredientTextFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.ingredientTextFieldTextController',
              const Duration(milliseconds: 2000),
              () async {
                await widget.ingredient!.reference
                    .update(createIngredientsRecordData(
                  ingredient: _model.ingredientTextFieldTextController.text,
                ));
              },
            ),
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              labelText: FFLocalizations.of(context).getText(
                'n0o4mk48' /* Ingredient */,
              ),
              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
              hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).primaryBackground,
            ),
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodySmallFamily),
                ),
            maxLines: null,
            validator: _model.ingredientTextFieldTextControllerValidator
                .asValidator(context),
          ),
        ),
      ].divide(const SizedBox(width: 8.0)),
    );
  }
}
