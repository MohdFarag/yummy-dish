import '/components/notification_badge_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/counter_card/counter_card_widget.dart';
import '/profile/settings_button/settings_button_widget.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NotificationBadge component.
  late NotificationBadgeModel notificationBadgeModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for CounterCard component.
  late CounterCardModel counterCardModel1;
  // Model for CounterCard component.
  late CounterCardModel counterCardModel2;
  // Model for CounterCard component.
  late CounterCardModel counterCardModel3;
  // Model for SettingsButton component.
  late SettingsButtonModel settingsButtonModel1;
  // Model for SettingsButton component.
  late SettingsButtonModel settingsButtonModel2;
  // Model for SettingsButton component.
  late SettingsButtonModel settingsButtonModel3;

  @override
  void initState(BuildContext context) {
    notificationBadgeModel =
        createModel(context, () => NotificationBadgeModel());
    counterCardModel1 = createModel(context, () => CounterCardModel());
    counterCardModel2 = createModel(context, () => CounterCardModel());
    counterCardModel3 = createModel(context, () => CounterCardModel());
    settingsButtonModel1 = createModel(context, () => SettingsButtonModel());
    settingsButtonModel2 = createModel(context, () => SettingsButtonModel());
    settingsButtonModel3 = createModel(context, () => SettingsButtonModel());
  }

  @override
  void dispose() {
    notificationBadgeModel.dispose();
    counterCardModel1.dispose();
    counterCardModel2.dispose();
    counterCardModel3.dispose();
    settingsButtonModel1.dispose();
    settingsButtonModel2.dispose();
    settingsButtonModel3.dispose();
  }
}
