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

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get carrierId => getField<String>('carrier_id');
  set carrierId(String? value) => setField<String>('carrier_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get carrierDescription => getField<String>('carrier_description');
  set carrierDescription(String? value) =>
      setField<String>('carrier_description', value);

  int? get sumRoutes => getField<int>('sum_routes');
  set sumRoutes(int? value) => setField<int>('sum_routes', value);
}
