import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'select_role_widget.dart' show SelectRoleWidget;
import 'package:flutter/material.dart';

class SelectRoleModel extends FlutterFlowModel<SelectRoleWidget> {
  ///  Local state fields for this page.

  String? role;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in select_role widget.
  List<UsersRow>? currentUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
