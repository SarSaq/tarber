import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'error_bottom_sheet_model.dart';
export 'error_bottom_sheet_model.dart';

/// Create a Bottom Sheet component for TarBer cargo app.
///
/// STYLE: Dark blue gradient background (#0D1B3E to #1B4FD8), yellow
/// (#FFB800) accent, Inter font. Top corners border radius 24px.
///
/// LAYOUT top to bottom:
///
/// 1. Handle bar: small gray rounded bar centered top, 40x4px, 30% white
/// opacity.
///
/// 2. Icon: large circle yellow background (#FFB800), warning icon navy
/// (#0D1B3E), size 64px, centered.
///
/// 3. Text:
/// Title "Заполните форму" white bold 20px centered.
/// Subtitle "Заполните все обязательные поля" gray small centered.
///
/// 4. Button: full width yellow (#FFB800), text "Исправить" navy bold, border
/// radius 16px, height 52px, margin 24px sides.
///
/// Padding: 24px all sides.
/// No close button.
class ErrorBottomSheetWidget extends StatefulWidget {
  const ErrorBottomSheetWidget({
    super.key,
    this.button,
    this.title,
    this.text,
    this.icon,
  });

  final String? button;
  final String? title;
  final String? text;
  final Widget? icon;

  @override
  State<ErrorBottomSheetWidget> createState() => _ErrorBottomSheetWidgetState();
}

class _ErrorBottomSheetWidgetState extends State<ErrorBottomSheetWidget> {
  late ErrorBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ErrorBottomSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x48000000),
              offset: Offset(
                0.0,
                5.0,
              ),
            )
          ],
          gradient: LinearGradient(
            colors: [
              FlutterFlowTheme.of(context).accent4,
              FlutterFlowTheme.of(context).primary
            ],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(0.64, 1.0),
            end: AlignmentDirectional(-0.64, -1.0),
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(18.0, 24.0, 18.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Color(0x4DFFFFFF),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              Container(
                width: 64.0,
                height: 64.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFFB800),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: widget.icon!,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.title,
                      'пусто',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                          ),
                          color: Colors.white,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.text,
                      'пусто',
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                          color: Color(0x99FFFFFF),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: widget.button!,
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFFFB800),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: Color(0xFF0D1B3E),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
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
      ),
    );
  }
}
