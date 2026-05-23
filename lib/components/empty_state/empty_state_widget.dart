import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'empty_state_model.dart';
export 'empty_state_model.dart';

/// Create a reusable empty state component called empty_state.
///
/// Structure: Column, centered horizontally and vertically, spacing 16px
/// Elements:
///
/// Icon widget, size 64px, color #1B4FD8
/// Text widget, font Roboto Regular 14px, color #6C6C70, text align center,
/// max width 240px
///
/// Component parameters:
///
/// iconName (String) — icon to display
/// message (String) — hint text to display
///
/// Style:
///
/// Background transparent
/// Padding 32px all sides
/// No shadows, no borders
class EmptyStateWidget extends StatefulWidget {
  const EmptyStateWidget({
    super.key,
    this.iconName,
    String? message,
    String? title,
  })  : this.message = message ?? '',
        this.title = title ?? '';

  final Widget? iconName;
  final String message;
  final String title;

  @override
  State<EmptyStateWidget> createState() => _EmptyStateWidgetState();
}

class _EmptyStateWidgetState extends State<EmptyStateWidget> {
  late EmptyStateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStateModel());

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
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.rectangle,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.roboto(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          widget.iconName!,
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Text(
              widget.message,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    font: GoogleFonts.roboto(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).alternate,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                  ),
            ),
          ),
        ].divide(SizedBox(height: 8.0)),
      ),
    );
  }
}
