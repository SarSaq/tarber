import '/backend/supabase/supabase.dart';
import '/components/result_card/result_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'favorite_routes_widget.dart' show FavoriteRoutesWidget;
import 'package:flutter/material.dart';

class FavoriteRoutesModel extends FlutterFlowModel<FavoriteRoutesWidget> {
  ///  Local state fields for this page.

  String selectedTab = 'route';

  List<SubscribesRow> favorites = [];
  void addToFavorites(SubscribesRow item) => favorites.add(item);
  void removeFromFavorites(SubscribesRow item) => favorites.remove(item);
  void removeAtIndexFromFavorites(int index) => favorites.removeAt(index);
  void insertAtIndexInFavorites(int index, SubscribesRow item) =>
      favorites.insert(index, item);
  void updateFavoritesAtIndex(int index, Function(SubscribesRow) updateFn) =>
      favorites[index] = updateFn(favorites[index]);

  int count = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in favorite_routes widget.
  List<SubscribesRow>? userSubscribes;
  // Stores action output result for [Backend Call - Query Rows] action in favorite_routes widget.
  List<FavoriteCarriersRow>? userCarrierFavorites;
  // Models for result_card dynamic component.
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
