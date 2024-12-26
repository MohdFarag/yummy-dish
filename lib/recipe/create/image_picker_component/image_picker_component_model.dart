import '/flutter_flow/flutter_flow_util.dart';
import 'image_picker_component_widget.dart' show ImagePickerComponentWidget;
import 'package:flutter/material.dart';

class ImagePickerComponentModel
    extends FlutterFlowModel<ImagePickerComponentWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
