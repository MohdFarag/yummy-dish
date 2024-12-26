import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'preperation_step_input_component_model.dart';
export 'preperation_step_input_component_model.dart';

class PreperationStepInputComponentWidget extends StatefulWidget {
  const PreperationStepInputComponentWidget({
    super.key,
    int? stepNumber,
    this.stepDescription,
  }) : stepNumber = stepNumber ?? 1;

  final int stepNumber;
  final String? stepDescription;

  @override
  State<PreperationStepInputComponentWidget> createState() =>
      _PreperationStepInputComponentWidgetState();
}

class _PreperationStepInputComponentWidgetState
    extends State<PreperationStepInputComponentWidget> {
  late PreperationStepInputComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreperationStepInputComponentModel());

    _model.preperationStepTextFieldTextController ??=
        TextEditingController(text: widget.stepDescription);
    _model.preperationStepTextFieldFocusNode ??= FocusNode();

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
      children: [
        Container(
          width: 32.0,
          height: 32.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.stepNumber.toString(),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.preperationStepTextFieldTextController,
            focusNode: _model.preperationStepTextFieldFocusNode,
            onChanged: (_) => EasyDebounce.debounce(
              '_model.preperationStepTextFieldTextController',
              const Duration(milliseconds: 2000),
              () => safeSetState(() {}),
            ),
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              labelText: FFLocalizations.of(context).getText(
                '3mj2wp9k' /* Step Description */,
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
              suffixIcon: _model
                      .preperationStepTextFieldTextController!.text.isNotEmpty
                  ? InkWell(
                      onTap: () async {
                        _model.preperationStepTextFieldTextController?.clear();
                        safeSetState(() {});
                      },
                      child: Icon(
                        Icons.clear,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 22.0,
                      ),
                    )
                  : null,
            ),
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyLargeFamily),
                ),
            maxLines: null,
            validator: _model.preperationStepTextFieldTextControllerValidator
                .asValidator(context),
          ),
        ),
      ].divide(const SizedBox(width: 12.0)),
    );
  }
}
