import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favorite_carrier_card_model.dart';
export 'favorite_carrier_card_model.dart';

class FavoriteCarrierCardWidget extends StatefulWidget {
  const FavoriteCarrierCardWidget({
    super.key,
    required this.sumRoutes,
    required this.avatar,
    required this.carrierName,
    this.carrierId,
  });

  final int? sumRoutes;
  final String? avatar;
  final String? carrierName;
  final String? carrierId;

  @override
  State<FavoriteCarrierCardWidget> createState() =>
      _FavoriteCarrierCardWidgetState();
}

class _FavoriteCarrierCardWidgetState extends State<FavoriteCarrierCardWidget> {
  late FavoriteCarrierCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteCarrierCardModel());

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
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Container(
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondary,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: valueOrDefault<String>(
                            widget.avatar,
                            'https://images.unsplash.com/photo-1622624751362-328ec4aa688f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxhcmFyYXR8ZW58MHx8fHwxNzgwMjQ3Njg3fDA&ixlib=rb-4.1.0&q=80&w=400',
                          ),
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 0.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.carrierName,
                              'Ararat Masisyan',
                            ),
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                  lineHeight: 1.35,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Icon(
                            Icons.verified_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 16.0,
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: FlutterFlowTheme.of(context).warning,
                                size: 20.0,
                              ),
                              Text(
                                '5.0',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                      lineHeight: 1.38,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                          Icon(
                            Icons.circle_sharp,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 6.0,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.local_shipping_outlined,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 20.0,
                              ),
                              Text(
                                widget.sumRoutes!.toString(),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                      lineHeight: 1.27,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ].divide(SizedBox(width: 6.0)),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 8.0,
                      icon: Icon(
                        Icons.star_rounded,
                        color: FFAppState()
                                .userFavoriteCarrierIds
                                .contains(widget.carrierId)
                            ? FlutterFlowTheme.of(context).secondary
                            : FlutterFlowTheme.of(context).alternate,
                        size: 32.0,
                      ),
                      onPressed: () async {
                        if (FFAppState()
                            .userFavoriteCarrierIds
                            .contains(widget.carrierId)) {
                          await actions.removeCarrierFromFavorites(
                            widget.carrierId!,
                          );
                          FFAppState().removeFromUserFavoriteCarrierIds(
                              widget.carrierId!);
                          FFAppState().update(() {});
                        } else {
                          await actions.addCarrierToFavorites(
                            widget.carrierId!,
                          );
                          FFAppState()
                              .addToUserFavoriteCarrierIds(widget.carrierId!);
                          FFAppState().update(() {});
                        }
                      },
                    ),
                  ],
                ),
              ].divide(SizedBox(width: 16.0)),
            ),
          ],
        ),
      ),
    );
  }
}
