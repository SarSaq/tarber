import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_route_widget.dart' show AddRouteWidget;
import 'package:flutter/material.dart';

class AddRouteModel extends FlutterFlowModel<AddRouteWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for from widget.
  String? fromValue;
  FormFieldController<String>? fromValueController;
  // State field(s) for to widget.
  String? toValue;
  FormFieldController<String>? toValueController;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  String? _priceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Укажите цену доставки';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for alcohol widget.
  bool? alcoholValue;
  // State field(s) for electronics widget.
  bool? electronicsValue;
  // State field(s) for foods widget.
  bool? foodsValue;
  // State field(s) for medicine widget.
  bool? medicineValue;

  @override
  void initState(BuildContext context) {
    priceTextControllerValidator = _priceTextControllerValidator;
  }

  @override
  void dispose() {
    priceFocusNode?.dispose();
    priceTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
