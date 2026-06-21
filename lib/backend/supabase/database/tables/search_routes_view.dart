import '../database.dart';

class SearchRoutesViewTable extends SupabaseTable<SearchRoutesViewRow> {
  @override
  String get tableName => 'search_routes_view';

  @override
  SearchRoutesViewRow createRow(Map<String, dynamic> data) =>
      SearchRoutesViewRow(data);
}

class SearchRoutesViewRow extends SupabaseDataRow {
  SearchRoutesViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SearchRoutesViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

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

  bool? get foods => getField<bool>('foods');
  set foods(bool? value) => setField<bool>('foods', value);

  bool? get alcohol => getField<bool>('alcohol');
  set alcohol(bool? value) => setField<bool>('alcohol', value);

  bool? get electronics => getField<bool>('electronics');
  set electronics(bool? value) => setField<bool>('electronics', value);

  bool? get medicines => getField<bool>('medicines');
  set medicines(bool? value) => setField<bool>('medicines', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get userDescription => getField<String>('user_description');
  set userDescription(String? value) =>
      setField<String>('user_description', value);

  int? get sumSubscribes => getField<int>('sum_subscribes');
  set sumSubscribes(int? value) => setField<int>('sum_subscribes', value);

  int? get sumRoutes => getField<int>('sum_routes');
  set sumRoutes(int? value) => setField<int>('sum_routes', value);
}
