import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'result_card_model.dart';
export 'result_card_model.dart';

class ResultCardWidget extends StatefulWidget {
  const ResultCardWidget({
    super.key,
    required this.from,
    required this.to,
    required this.price,
    required this.avatar,
    required this.profileName,
    required this.routeId,
  });

  final String? from;
  final String? to;
  final int? price;
  final String? avatar;
  final String? profileName;
  final int? routeId;

  @override
  State<ResultCardWidget> createState() => _ResultCardWidgetState();
}

class _ResultCardWidgetState extends State<ResultCardWidget> {
  late ResultCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 12.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              0.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.from} - ${widget.to}',
                      style:
                          FlutterFlowTheme.of(context).displayMedium.override(
                                font: GoogleFonts.roboto(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .fontStyle,
                              ),
                    ),
                    Text(
                      '${widget.price?.toString()} руб/кг',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).alternate,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 24.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.route,
                          color: FFAppState()
                                  .userFavoriteID
                                  .contains(widget.routeId)
                              ? FlutterFlowTheme.of(context).secondary
                              : FlutterFlowTheme.of(context).alternate,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (FFAppState()
                              .userFavoriteID
                              .contains(widget.routeId)) {
                            await actions.removeFromFavorites(
                              widget.routeId!,
                            );
                            FFAppState()
                                .removeFromUserFavoriteID(widget.routeId!);
                            FFAppState().update(() {});
                          } else {
                            await actions.addToFavorites(
                              widget.routeId!,
                            );
                            FFAppState().addToUserFavoriteID(widget.routeId!);
                            FFAppState().update(() {});
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: FlutterFlowTheme.of(context).alternate,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: ClipOval(
                        child: Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).secondary,
                              width: 1.0,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(1.5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl: widget.avatar != null &&
                                        widget.avatar != ''
                                    ? widget.avatar!
                                    : random_data.randomImageUrl(
                                        0,
                                        0,
                                      ),
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                                alignment: Alignment(0.0, 0.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.profileName,
                        'Carrier',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
