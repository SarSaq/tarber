import '../database.dart';

class FavoriteCarriersTable extends SupabaseTable<FavoriteCarriersRow> {
  @override
  String get tableName => 'favorite_carriers';

  @override
  FavoriteCarriersRow createRow(Map<String, dynamic> data) =>
      FavoriteCarriersRow(data);
}

class FavoriteCarriersRow extends SupabaseDataRow {
  FavoriteCarriersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavoriteCarriersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get carrierId => getField<String>('carrier_id');
  set carrierId(String? value) => setField<String>('carrier_id', value);
}
