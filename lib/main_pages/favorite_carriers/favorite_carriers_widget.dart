import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/empty_state/empty_state_widget.dart';
import '/components/favorite_carrier_card/favorite_carrier_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favorite_carriers_model.dart';
export 'favorite_carriers_model.dart';

class FavoriteCarriersWidget extends StatefulWidget {
  const FavoriteCarriersWidget({super.key});

  static String routeName = 'favorite_carriers';
  static String routePath = '/favoriteCarriers';

  @override
  State<FavoriteCarriersWidget> createState() => _FavoriteCarriersWidgetState();
}

class _FavoriteCarriersWidgetState extends State<FavoriteCarriersWidget> {
  late FavoriteCarriersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteCarriersModel());

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
      child: PopScope(
        canPop: false,
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
                    'Избранные перевозчики',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleLarge
                              .fontWeight,
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
            child: FutureBuilder<List<FavoriteCarriersViewRow>>(
              future: FavoriteCarriersViewTable().queryRows(
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
                List<FavoriteCarriersViewRow>
                    carriersFavoriteCarriersViewRowList = snapshot.data!;

                if (carriersFavoriteCarriersViewRowList.isEmpty) {
                  return Center(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      child: EmptyStateWidget(
                        iconName: Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 48.0,
                        ),
                        message:
                            'Нажмите на звёздочку в профиле перевозчика, чтобы добавить его в избранное',
                        title: 'У вас нет избранных перевозчиков',
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: carriersFavoriteCarriersViewRowList.length,
                  itemBuilder: (context, carriersIndex) {
                    final carriersFavoriteCarriersViewRow =
                        carriersFavoriteCarriersViewRowList[carriersIndex];
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
                            CarrierPublicWidget.routeName,
                            queryParameters: {
                              'carrierId': serializeParam(
                                carriersFavoriteCarriersViewRow.carrierId,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(),
                          child: wrapWithModel(
                            model: _model.favoriteCarrierCardModels.getModel(
                              carriersFavoriteCarriersViewRow.carrierId!,
                              carriersIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: FavoriteCarrierCardWidget(
                              key: Key(
                                'Keylt9_${carriersFavoriteCarriersViewRow.carrierId!}',
                              ),
                              sumRoutes:
                                  carriersFavoriteCarriersViewRow.sumRoutes!,
                              avatar: valueOrDefault<String>(
                                carriersFavoriteCarriersViewRow.avatarUrl,
                                'https://images.unsplash.com/photo-1622624751362-328ec4aa688f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxtYXNpc3xlbnwwfHx8fDE3Nzk2NTcyNzl8MA&ixlib=rb-4.1.0&q=80&w=400',
                              ),
                              carrierName: valueOrDefault<String>(
                                carriersFavoriteCarriersViewRow.name,
                                'Ararat Masisyan',
                              ),
                              carrierId:
                                  carriersFavoriteCarriersViewRow.carrierId,
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
