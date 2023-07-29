import '/backend/backend.dart';
import '/components/topo_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ClientePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topo component.
  late TopoModel topoModel;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topoModel = createModel(context, () => TopoModel());
  }

  void dispose() {
    unfocusNode.dispose();
    topoModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
