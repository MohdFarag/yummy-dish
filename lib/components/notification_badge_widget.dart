import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_badge_model.dart';
export 'notification_badge_model.dart';

class NotificationBadgeWidget extends StatefulWidget {
  const NotificationBadgeWidget({super.key});

  @override
  State<NotificationBadgeWidget> createState() =>
      _NotificationBadgeWidgetState();
}

class _NotificationBadgeWidgetState extends State<NotificationBadgeWidget> {
  late NotificationBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationBadgeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: Text(
        FFLocalizations.of(context).getText(
          'xlisc1fw' /* 1 */,
        ),
        style: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
              fontSize: 12.0,
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
            ),
      ),
      showBadge: true,
      shape: badges.BadgeShape.circle,
      badgeColor: FlutterFlowTheme.of(context).primary,
      elevation: 4.0,
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      position: badges.BadgePosition.topEnd(),
      animationType: badges.BadgeAnimationType.scale,
      toAnimate: true,
      child: FlutterFlowIconButton(
        borderColor: FlutterFlowTheme.of(context).primary,
        borderRadius: 24.0,
        buttonSize: 48.0,
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        icon: Icon(
          Icons.notifications_none,
          color: FlutterFlowTheme.of(context).primaryText,
          size: 30.0,
        ),
        onPressed: () {
          print('IconButton pressed ...');
        },
      ),
    );
  }
}
