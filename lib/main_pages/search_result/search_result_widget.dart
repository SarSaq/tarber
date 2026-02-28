import '/backend/supabase/supabase.dart';
import '/components/result_card/result_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_result_model.dart';
export 'search_result_model.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  static String routeName = 'Search_result';
  static String routePath = '/searchResult';

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  late SearchResultModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchResultModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 54.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  'Результаты поиска',
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleLarge.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleLarge.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleLarge.fontStyle,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 2.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: FutureBuilder<List<RoutesRow>>(
              future: RoutesTable().queryRows(
                queryFn: (q) => q
                    .eqOrNull(
                      'from',
                      FFAppState().cityFROM,
                    )
                    .eqOrNull(
                      'to',
                      FFAppState().cityTO,
                    ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF0056B3),
                        ),
                      ),
                    ),
                  );
                }
                List<RoutesRow> listViewRoutesRowList = snapshot.data!;

                return ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  scrollDirection: Axis.vertical,
                  itemCount: listViewRoutesRowList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 16.0),
                  itemBuilder: (context, listViewIndex) {
                    final listViewRoutesRow =
                        listViewRoutesRowList[listViewIndex];
                    return FutureBuilder<List<UsersRow>>(
                      future: UsersTable().querySingleRow(
                        queryFn: (q) => q.eqOrNull(
                          'id',
                          listViewRoutesRow.user,
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF0056B3),
                                ),
                              ),
                            ),
                          );
                        }
                        List<UsersRow> resultCardUsersRowList = snapshot.data!;

                        final resultCardUsersRow =
                            resultCardUsersRowList.isNotEmpty
                                ? resultCardUsersRowList.first
                                : null;

                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              RouteDetailsWidget.routeName,
                              queryParameters: {
                                'routeReceive': serializeParam(
                                  listViewRoutesRow,
                                  ParamType.SupabaseRow,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: wrapWithModel(
                            model: _model.resultCardModels.getModel(
                              listViewRoutesRow.id.toString(),
                              listViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: ResultCardWidget(
                              key: Key(
                                'Keyje0_${listViewRoutesRow.id.toString()}',
                              ),
                              from: listViewRoutesRow.from!,
                              to: listViewRoutesRow.to!,
                              price: listViewRoutesRow.priceKG!,
                              avatar: resultCardUsersRow!.phone!,
                              profileName: resultCardUsersRow.name!,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
