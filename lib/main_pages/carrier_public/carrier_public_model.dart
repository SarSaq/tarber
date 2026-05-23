import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'carrier_public_widget.dart' show CarrierPublicWidget;
import 'package:flutter/material.dart';

class CarrierPublicModel extends FlutterFlowModel<CarrierPublicWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in carrier_public widget.
  List<RoutesRow>? carrierAllTrips;
  // Stores action output result for [Backend Call - Query Rows] action in carrier_public widget.
  List<FavoriteCarriersRow>? carrierFavorites;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
