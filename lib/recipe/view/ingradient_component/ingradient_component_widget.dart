import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ingradient_component_model.dart';
export 'ingradient_component_model.dart';

class IngradientComponentWidget extends StatefulWidget {
  const IngradientComponentWidget({
    super.key,
    required this.ingredient,
  });

  final IngredientsRecord? ingredient;

  @override
  State<IngradientComponentWidget> createState() =>
      _IngradientComponentWidgetState();
}

class _IngradientComponentWidgetState extends State<IngradientComponentWidget> {
  late IngradientComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IngradientComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              valueOrDefault<String>(
                '${valueOrDefault<String>(
                  formatNumber(
                    widget.ingredient?.quantity,
                    formatType: FormatType.decimal,
                    decimalType: DecimalType.automatic,
                  ),
                  '0',
                )} ${valueOrDefault<String>(
                  widget.ingredient?.unit,
                  'unit',
                )}',
                'quantity+unit',
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
            ),
            Text(
              valueOrDefault<String>(
                widget.ingredient?.ingredient,
                'ingredient',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyMediumFamily),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
