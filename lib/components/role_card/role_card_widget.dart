import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'role_card_model.dart';
export 'role_card_model.dart';

class RoleCardWidget extends StatefulWidget {
  const RoleCardWidget({
    super.key,
    this.selected,
    this.icon,
    this.title,
    this.subtitle,
  });

  final bool? selected;
  final Widget? icon;
  final String? title;
  final String? subtitle;

  @override
  State<RoleCardWidget> createState() => _RoleCardWidgetState();
}

class _RoleCardWidgetState extends State<RoleCardWidget> {
  late RoleCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoleCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32.0),
      child: Container(
        height: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          border: Border.all(
            color: widget.selected!
                ? FlutterFlowTheme.of(context).secondary
                : Color(0x1AFFFFFF),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color:
                      widget.selected! ? Color(0x22FFB800) : Color(0x0AFFFFFF),
                  borderRadius: BorderRadius.circular(9999.0),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Icon(
                  Icons.inventory_2_rounded,
                  color: widget.selected!
                      ? Color(0xFFFFB800)
                      : FlutterFlowTheme.of(context).secondaryText,
                  size: 48.0,
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.title,
                        'Я отправляю',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.subtitle,
                        'Найду перевозчика и отправлю посылку',
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.roboto(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).alternate,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
