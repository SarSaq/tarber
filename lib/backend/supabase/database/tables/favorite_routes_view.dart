import '../database.dart';

class FavoriteRoutesViewTable extends SupabaseTable<FavoriteRoutesViewRow> {
  @override
  String get tableName => 'favorite_routes_view';

  @override
  FavoriteRoutesViewRow createRow(Map<String, dynamic> data) =>
      FavoriteRoutesViewRow(data);
}

class FavoriteRoutesViewRow extends SupabaseDataRow {
  FavoriteRoutesViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavoriteRoutesViewTable();

  int? get subscribeId => getField<int>('subscribe_id');
  set subscribeId(int? value) => setField<int>('subscribe_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get routeId => getField<int>('route_id');
  set routeId(int? value) => setField<int>('route_id', value);

  DateTime? get subscribeCreatedAt =>
      getField<DateTime>('subscribe_created_at');
  set subscribeCreatedAt(DateTime? value) =>
      setField<DateTime>('subscribe_created_at', value);

  int? get routeIdInternal => getField<int>('route_id_internal');
  set routeIdInternal(int? value) => setField<int>('route_id_internal', value);

  String? get from => getField<String>('from');
  set from(String? value) => setField<String>('from', value);

  String? get to => getField<String>('to');
  set to(String? value) => setField<String>('to', value);

  int? get priceKG => getField<int>('priceKG');
  set priceKG(int? value) => setField<int>('priceKG', value);

  DateTime? get routeDate => getField<DateTime>('routeDate');
  set routeDate(DateTime? value) => setField<DateTime>('routeDate', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get routeOwnerId => getField<String>('route_owner_id');
  set routeOwnerId(String? value) => setField<String>('route_owner_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);
}
