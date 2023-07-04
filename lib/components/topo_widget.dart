import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'topo_model.dart';
export 'topo_model.dart';

class TopoWidget extends StatefulWidget {
  const TopoWidget({Key? key}) : super(key: key);

  @override
  _TopoWidgetState createState() => _TopoWidgetState();
}

class _TopoWidgetState extends State<TopoWidget> {
  late TopoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 75.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/cado1-removebg-preview.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Controle de Containers',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Fonte Tecadi',
                          color: FlutterFlowTheme.of(context).azulPadrao,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.8, 0.85),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.white,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 50.0,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.playlist_add_sharp,
                      color: FlutterFlowTheme.of(context).azulPadrao,
                      size: 30.0,
                    ),
                    showLoadingIndicator: true,
                    onPressed: () async {
                      context.goNamed('cadastroPage');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
