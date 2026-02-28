import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'phone_verify_widget.dart' show PhoneVerifyWidget;
import 'package:flutter/material.dart';

class PhoneVerifyModel extends FlutterFlowModel<PhoneVerifyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Custom Action - verifyPhoneOtp] action in PinCode widget.
  bool? infoVerify;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
