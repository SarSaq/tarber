import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/result_card/result_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favorite_routes_model.dart';
export 'favorite_routes_model.dart';

class FavoriteRoutesWidget extends StatefulWidget {
  const FavoriteRoutesWidget({super.key});

  static String routeName = 'favorite_routes';
  static String routePath = '/favoriteRoutes';

  @override
  State<FavoriteRoutesWidget> createState() => _FavoriteRoutesWidgetState();
}

class _FavoriteRoutesWidgetState extends State<FavoriteRoutesWidget> {
  late FavoriteRoutesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteRoutesModel());

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
      safeSetState(() {});
      _model.userCarrierFavorites = await FavoriteCarriersTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'user_id',
          currentUserUid,
        ),
      );
      FFAppState().userFavoriteCarrierIds = _model.userCarrierFavorites!
          .map((e) => e.carrierId)
          .withoutNulls
          .toList()
          .toList()
          .cast<String>();
      safeSetState(() {});
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
                backgroundColor: Color(0x00EE8B60),
                automaticallyImplyLeading: false,
                title: Text(
                  'Отслеживаемые рейсы',
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
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: FutureBuilder<List<FavoriteRoutesViewRow>>(
              future: FavoriteRoutesViewTable().queryRows(
                queryFn: (q) => q.eqOrNull(
                  'user_id',
                  currentUserUid,
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
                List<FavoriteRoutesViewRow> routesFavoriteRoutesViewRowList =
                    snapshot.data!;

                if (routesFavoriteRoutesViewRowList.isEmpty) {
                  return Center(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      child: EmptyStateWidget(
                        iconName: Icon(
                          Icons.route,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 48.0,
                        ),
                        message:
                            'Нажмите значок маршрута на карточке рейса, чтобы отслеживать его',
                        title: 'У вас нет отслеживаемых рейсов',
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: routesFavoriteRoutesViewRowList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 16.0),
                  itemBuilder: (context, routesIndex) {
                    final routesFavoriteRoutesViewRow =
                        routesFavoriteRoutesViewRowList[routesIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          RouteDetailsWidget.routeName,
                          queryParameters: {
                            'routeId': serializeParam(
                              routesFavoriteRoutesViewRow.id,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.resultCardModels.getModel(
                              routesFavoriteRoutesViewRow.id!.toString(),
                              routesIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: ResultCardWidget(
                              key: Key(
                                'Keygz9_${routesFavoriteRoutesViewRow.id!.toString()}',
                              ),
                              from: routesFavoriteRoutesViewRow.from!,
                              to: routesFavoriteRoutesViewRow.to!,
                              price: routesFavoriteRoutesViewRow.priceKG!,
                              avatar:
                                  routesFavoriteRoutesViewRow.carrierAvatar!,
                              profileName:
                                  routesFavoriteRoutesViewRow.carrierName!,
                              routeId: routesFavoriteRoutesViewRow.id!,
                            ),
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
      ),
    );
  }
}
