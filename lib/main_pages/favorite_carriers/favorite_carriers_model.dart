import '/backend/supabase/supabase.dart';
import '/components/favorite_carrier_card/favorite_carrier_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'favorite_carriers_widget.dart' show FavoriteCarriersWidget;
import 'package:flutter/material.dart';

class FavoriteCarriersModel extends FlutterFlowModel<FavoriteCarriersWidget> {
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

  // Stores action output result for [Backend Call - Query Rows] action in favorite_carriers widget.
  List<SubscribesRow>? userSubscribes;
  // Stores action output result for [Backend Call - Query Rows] action in favorite_carriers widget.
  List<FavoriteCarriersRow>? userCarrierFavorites;
  // Models for favorite_carrierCard dynamic component.
  late FlutterFlowDynamicModels<FavoriteCarrierCardModel>
      favoriteCarrierCardModels;

  @override
  void initState(BuildContext context) {
    favoriteCarrierCardModels =
        FlutterFlowDynamicModels(() => FavoriteCarrierCardModel());
  }

  @override
  void dispose() {
    favoriteCarrierCardModels.dispose();
  }
}
