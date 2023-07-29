import '/components/topo_voltar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SendFilePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topoVoltar component.
  late TopoVoltarModel topoVoltarModel;
  // State field(s) for TextFieldSendEmail widget.
  TextEditingController? textFieldSendEmailController;
  String? Function(BuildContext, String?)?
      textFieldSendEmailControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topoVoltarModel = createModel(context, () => TopoVoltarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    topoVoltarModel.dispose();
    textFieldSendEmailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
