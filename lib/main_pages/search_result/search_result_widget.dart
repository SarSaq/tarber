import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/result_card/result_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_result_model.dart';
export 'search_result_model.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  static String routeName = 'search_result';
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

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userSubscribes = await SubscribesTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      FFAppState().userFavoriteID = _model.userSubscribes!
          .map((e) => e.routeId)
          .withoutNulls
          .toList()
          .toList()
          .cast<int>();
      FFAppState().update(() {});
    });

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
          child: FutureBuilder<List<SearchRoutesViewRow>>(
            future: SearchRoutesViewTable().queryRows(
              queryFn: (q) => q
                  .eqOrNull(
                    'from',
                    FFAppState().searchFrom,
                  )
                  .eqOrNull(
                    'to',
                    FFAppState().searchTo,
                  ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitFadingCube(
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 50.0,
                    ),
                  ),
                );
              }
              List<SearchRoutesViewRow> listViewSearchRoutesViewRowList =
                  snapshot.data!;

              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewSearchRoutesViewRowList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewSearchRoutesViewRow =
                      listViewSearchRoutesViewRowList[listViewIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          RouteDetailsWidget.routeName,
                          queryParameters: {
                            'routeId': serializeParam(
                              listViewSearchRoutesViewRow.id,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: wrapWithModel(
                        model: _model.resultCardModels.getModel(
                          listViewSearchRoutesViewRow.id!.toString(),
                          listViewIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: ResultCardWidget(
                          key: Key(
                            'Keyje0_${listViewSearchRoutesViewRow.id!.toString()}',
                          ),
                          from: listViewSearchRoutesViewRow.from!,
                          to: listViewSearchRoutesViewRow.to!,
                          price: listViewSearchRoutesViewRow.priceKG!,
                          avatar: listViewSearchRoutesViewRow.carrierAvatar!,
                          profileName: listViewSearchRoutesViewRow.carrierName!,
                          routeId: listViewSearchRoutesViewRow.id!,
                          status: listViewSearchRoutesViewRow.status!,
                          routeDate: listViewSearchRoutesViewRow.routeDate!,
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
