import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_trip_widget.dart' show AddTripWidget;
import 'package:flutter/material.dart';

class AddTripModel extends FlutterFlowModel<AddTripWidget> {
  ///  Local state fields for this page.

  bool food = false;

  bool electrics = false;

  bool medicine = false;

  bool alcohol = false;

  DateTime? date;

  String? fromCity = '';

  String? toCity = '';

  bool showErrors = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for fromC widget.
  String? fromCValue;
  FormFieldController<String>? fromCValueController;
  // Stores action output result for [Backend Call - Query Rows] action in fromC widget.
  List<CitiesRow>? fromCityData;
  // State field(s) for toC widget.
  String? toCValue;
  FormFieldController<String>? toCValueController;
  // Stores action output result for [Backend Call - Query Rows] action in toC widget.
  List<CitiesRow>? toCityData;
  DateTime? datePicked;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    priceFocusNode?.dispose();
    priceTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
