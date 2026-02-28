import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'complete_profile_widget.dart' show CompleteProfileWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CompleteProfileModel extends FlutterFlowModel<CompleteProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in complete_profile widget.
  List<UsersRow>? currentUser;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
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
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    armPhoneFocusNode?.dispose();
    armPhoneTextController?.dispose();

    ruPhoneFocusNode?.dispose();
    ruPhoneTextController?.dispose();
  }
}
