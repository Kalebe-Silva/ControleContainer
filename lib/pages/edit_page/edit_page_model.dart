import '/backend/backend.dart';
import '/components/topo_voltar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topoVoltar component.
  late TopoVoltarModel topoVoltarModel;
  // State field(s) for TextFieldNomeEdit widget.
  TextEditingController? textFieldNomeEditController;
  String? Function(BuildContext, String?)? textFieldNomeEditControllerValidator;
  // State field(s) for TextFieldPracaEdit widget.
  TextEditingController? textFieldPracaEditController;
  String? Function(BuildContext, String?)?
      textFieldPracaEditControllerValidator;
  // State field(s) for DropDownEdit widget.
  String? dropDownEditValue;
  FormFieldController<String>? dropDownEditValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topoVoltarModel = createModel(context, () => TopoVoltarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    topoVoltarModel.dispose();
    textFieldNomeEditController?.dispose();
    textFieldPracaEditController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
