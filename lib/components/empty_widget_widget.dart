import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'empty_widget_model.dart';
export 'empty_widget_model.dart';

class EmptyWidgetWidget extends StatefulWidget {
  const EmptyWidgetWidget({super.key});

  @override
  State<EmptyWidgetWidget> createState() => _EmptyWidgetWidgetState();
}

class _EmptyWidgetWidgetState extends State<EmptyWidgetWidget> {
  late EmptyWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      FFLocalizations.of(context).getText(
        'uig3ff8g' /* No Content */,
      ),
      textAlign: TextAlign.center,
      style: FlutterFlowTheme.of(context).displaySmall.override(
            fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
            letterSpacing: 0.0,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
          ),
    );
  }
}
