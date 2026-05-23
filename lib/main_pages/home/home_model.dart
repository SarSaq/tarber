import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Home widget.
  List<UsersRow>? currentUser;
  // State field(s) for fromCity widget.
  String? fromCityValue;
  FormFieldController<String>? fromCityValueController;
  // Stores action output result for [Backend Call - Query Rows] action in fromCity widget.
  List<CitiesRow>? fromCityData;
  // State field(s) for toCity widget.
  String? toCityValue;
  FormFieldController<String>? toCityValueController;
  // Stores action output result for [Backend Call - Query Rows] action in toCity widget.
  List<CitiesRow>? toCityData;
  DateTime? datePicked;

  /// Query cache managers for this widget.

  final _cityDataManager = FutureRequestManager<List<CitiesRow>>();
  Future<List<CitiesRow>> cityData({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CitiesRow>> Function() requestFn,
  }) =>
      _cityDataManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCityDataCache() => _cityDataManager.clear();
  void clearCityDataCacheKey(String? uniqueKey) =>
      _cityDataManager.clearRequest(uniqueKey);

  final _tripsDataManager = FutureRequestManager<List<RoutesRow>>();
  Future<List<RoutesRow>> tripsData({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<RoutesRow>> Function() requestFn,
  }) =>
      _tripsDataManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTripsDataCache() => _tripsDataManager.clear();
  void clearTripsDataCacheKey(String? uniqueKey) =>
      _tripsDataManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearCityDataCache();

    clearTripsDataCache();
  }
}
