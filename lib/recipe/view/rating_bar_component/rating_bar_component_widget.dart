import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rating_bar_component_model.dart';
export 'rating_bar_component_model.dart';

class RatingBarComponentWidget extends StatefulWidget {
  const RatingBarComponentWidget({
    super.key,
    required this.onChange,
    this.rating,
  });

  final Future Function()? onChange;
  final double? rating;

  @override
  State<RatingBarComponentWidget> createState() =>
      _RatingBarComponentWidgetState();
}

class _RatingBarComponentWidgetState extends State<RatingBarComponentWidget> {
  late RatingBarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingBarComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          FFLocalizations.of(context).getText(
            'ei1jmheo' /* Rate this recipe */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap().containsKey(
                    FlutterFlowTheme.of(context).headlineMediumFamily),
              ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: RatingBar.builder(
            onRatingUpdate: (newValue) =>
                safeSetState(() => _model.ratingBarValue = newValue),
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: FlutterFlowTheme.of(context).primary,
            ),
            direction: Axis.horizontal,
            initialRating: _model.ratingBarValue ??= widget.rating!,
            unratedColor: FlutterFlowTheme.of(context).accent1,
            itemCount: 5,
            itemSize: 30.0,
            glowColor: FlutterFlowTheme.of(context).primary,
          ),
        ),
        FFButtonWidget(
          onPressed: () async {
            await widget.onChange?.call();
          },
          text: FFLocalizations.of(context).getText(
            'ku31mfjg' /* Rate */,
          ),
          options: FFButtonOptions(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                  color: Colors.white,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).titleSmallFamily),
                ),
            elevation: 0.0,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ].divide(const SizedBox(height: 12.0)),
    );
  }
}
