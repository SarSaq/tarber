import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in user_profile widget.
  List<RoutesRow>? currentUserTrips;

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
    /// Dispose query cache managers for this widget.

    clearUserProfileDataCache();
  }
}
