import '../database.dart';

class FavoriteCarriersViewTable extends SupabaseTable<FavoriteCarriersViewRow> {
  @override
  String get tableName => 'favorite_carriers_view';

  @override
  FavoriteCarriersViewRow createRow(Map<String, dynamic> data) =>
      FavoriteCarriersViewRow(data);
}

class FavoriteCarriersViewRow extends SupabaseDataRow {
  FavoriteCarriersViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavoriteCarriersViewTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get carrierId => getField<String>('carrier_id');
  set carrierId(String? value) => setField<String>('carrier_id', value);

  String? get carrierName => getField<String>('carrier_name');
  set carrierName(String? value) => setField<String>('carrier_name', value);

  String? get carrierAvatar => getField<String>('carrier_avatar');
  set carrierAvatar(String? value) => setField<String>('carrier_avatar', value);

  String? get carrierPhone => getField<String>('carrier_phone');
  set carrierPhone(String? value) => setField<String>('carrier_phone', value);

  String? get carrierDescription => getField<String>('carrier_description');
  set carrierDescription(String? value) =>
      setField<String>('carrier_description', value);

  int? get sumRoutes => getField<int>('sum_routes');
  set sumRoutes(int? value) => setField<int>('sum_routes', value);
}
