import '/components/result_card/result_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'search_result_widget.dart' show SearchResultWidget;
import 'package:flutter/material.dart';

class SearchResultModel extends FlutterFlowModel<SearchResultWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for result_Card dynamic component.
  late FlutterFlowDynamicModels<ResultCardModel> resultCardModels;

  @override
  void initState(BuildContext context) {
    resultCardModels = FlutterFlowDynamicModels(() => ResultCardModel());
  }

  @override
  void dispose() {
    resultCardModels.dispose();
  }
}
