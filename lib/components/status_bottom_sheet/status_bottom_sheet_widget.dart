import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'status_bottom_sheet_model.dart';
export 'status_bottom_sheet_model.dart';

class StatusBottomSheetWidget extends StatefulWidget {
  const StatusBottomSheetWidget({
    super.key,
    this.oldStatus,
    required this.routeId,
  });

  final String? oldStatus;
  final int? routeId;

  @override
  State<StatusBottomSheetWidget> createState() =>
      _StatusBottomSheetWidgetState();
}

class _StatusBottomSheetWidgetState extends State<StatusBottomSheetWidget> {
  late StatusBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusBottomSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(18.0, 24.0, 18.0, 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            Text(
              'Изменить статус',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.roboto(
                      fontWeight:
                          FlutterFlowTheme.of(context).titleLarge.fontWeight,
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
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: () {
                      if (widget.oldStatus == 'recruiting') {
                        return Color(0xFF1B4FD8);
                      } else if (widget.oldStatus == 'closed') {
                        return Colors.orange;
                      } else if (widget.oldStatus == 'in_transit') {
                        return Color(0xFF7E57C2);
                      } else if (widget.oldStatus == 'delivered') {
                        return Color(0xFF2E7D32);
                      } else {
                        return FlutterFlowTheme.of(context).alternate;
                      }
                    }(),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          () {
                            if (widget.oldStatus == 'recruiting') {
                              return 'Набор груза';
                            } else if (widget.oldStatus == 'closed') {
                              return 'Набор закрыт';
                            } else if (widget.oldStatus == 'in_transit') {
                              return 'В пути';
                            } else if (widget.oldStatus == 'delivered') {
                              return 'Завершён';
                            } else {
                              return 'Неизвестно';
                            }
                          }(),
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                        ),
                      ].divide(SizedBox(width: 4.0)),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_downward_rounded,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 26.0,
                ),
              ].divide(SizedBox(height: 6.0)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await RoutesTable().update(
                    data: {
                      'status': () {
                        if (widget.oldStatus == 'recruiting') {
                          return 'closed';
                        } else if (widget.oldStatus == 'closed') {
                          return 'in_transit';
                        } else if (widget.oldStatus == 'in_transit') {
                          return 'delivered';
                        } else {
                          return '';
                        }
                      }(),
                    },
                    matchingRows: (rows) => rows.eqOrNull(
                      'id',
                      widget.routeId,
                    ),
                  );
                  Navigator.pop(context);
                  if (Navigator.of(context).canPop()) {
                    context.pop();
                  }
                  context.pushNamed(
                    RouteDetailsWidget.routeName,
                    queryParameters: {
                      'routeId': serializeParam(
                        widget.routeId,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                },
                text: () {
                  if (widget.oldStatus == 'recruiting') {
                    return 'Закрыть набор';
                  } else if (widget.oldStatus == 'closed') {
                    return 'Отправить в путь';
                  } else if (widget.oldStatus == 'in_transit') {
                    return 'Завершить рейс';
                  } else {
                    return 'Неизвестно';
                  }
                }(),
                icon: Icon(
                  Icons.arrow_forward_rounded,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: () {
                    if (widget.oldStatus == 'recruiting') {
                      return Colors.orange;
                    } else if (widget.oldStatus == 'closed') {
                      return Color(0xFF7E57C2);
                    } else if (widget.oldStatus == 'in_transit') {
                      return Color(0xFF2E7D32);
                    } else {
                      return FlutterFlowTheme.of(context).alternate;
                    }
                  }(),
                  textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.circular(36.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await RoutesTable().update(
                    data: {
                      'status': 'cancelled',
                    },
                    matchingRows: (rows) => rows.eqOrNull(
                      'id',
                      widget.routeId,
                    ),
                  );
                  Navigator.pop(context);
                  if (Navigator.of(context).canPop()) {
                    context.pop();
                  }
                  context.pushNamed(
                    RouteDetailsWidget.routeName,
                    queryParameters: {
                      'routeId': serializeParam(
                        widget.routeId,
                        ParamType.int,
                      ),
                    }.withoutNulls,
                  );
                },
                text: 'Отменить рейс',
                icon: Icon(
                  Icons.cancel_rounded,
                  size: 16.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48.0,
                  padding: EdgeInsets.all(8.0),
                  iconAlignment: IconAlignment.start,
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  color: FlutterFlowTheme.of(context).accent3,
                  textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.circular(36.0),
                ),
              ),
            ),
          ].divide(SizedBox(height: 18.0)),
        ),
      ),
    );
  }
}
