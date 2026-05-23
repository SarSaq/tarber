import '../database.dart';

class SubscribesTable extends SupabaseTable<SubscribesRow> {
  @override
  String get tableName => 'subscribes';

  @override
  SubscribesRow createRow(Map<String, dynamic> data) => SubscribesRow(data);
}

class SubscribesRow extends SupabaseDataRow {
  SubscribesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SubscribesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get routeId => getField<int>('route_id');
  set routeId(int? value) => setField<int>('route_id', value);
}
