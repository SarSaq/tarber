import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in edit_profile widget.
  List<RoutesRow>? currentUserTrips;
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

  /// Query cache managers for this widget.

  final _userProfileDataManager = FutureRequestManager<List<UsersRow>>();
  Future<List<UsersRow>> userProfileData({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRow>> Function() requestFn,
  }) =>
      _userProfileDataManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserProfileDataCache() => _userProfileDataManager.clear();
  void clearUserProfileDataCacheKey(String? uniqueKey) =>
      _userProfileDataManager.clearRequest(uniqueKey);

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

    /// Dispose query cache managers for this widget.

    clearUserProfileDataCache();
  }
}
