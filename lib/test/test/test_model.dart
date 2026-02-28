import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'test_widget.dart' show TestWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for arm_phone widget.
  FocusNode? armPhoneFocusNode;
  TextEditingController? armPhoneTextController;
  late MaskTextInputFormatter armPhoneMask;
  String? Function(BuildContext, String?)? armPhoneTextControllerValidator;
  // State field(s) for ru_phone widget.
  FocusNode? ruPhoneFocusNode;
  TextEditingController? ruPhoneTextController;
  late MaskTextInputFormatter ruPhoneMask;
  String? Function(BuildContext, String?)? ruPhoneTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    armPhoneFocusNode?.dispose();
    armPhoneTextController?.dispose();

    ruPhoneFocusNode?.dispose();
    ruPhoneTextController?.dispose();
  }
}
