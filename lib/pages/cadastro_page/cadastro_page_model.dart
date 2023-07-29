import '/components/topo_voltar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class CadastroPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for topoVoltar component.
  late TopoVoltarModel topoVoltarModel;
  // State field(s) for TextFieldContainer widget.
  TextEditingController? textFieldContainerController;
  String? Function(BuildContext, String?)?
      textFieldContainerControllerValidator;
  // State field(s) for TextFieldPraca widget.
  TextEditingController? textFieldPracaController;
  String? Function(BuildContext, String?)? textFieldPracaControllerValidator;
  // State field(s) for DropDownInsert widget.
  String? dropDownInsertValue;
  FormFieldController<String>? dropDownInsertValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    topoVoltarModel = createModel(context, () => TopoVoltarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    topoVoltarModel.dispose();
    textFieldContainerController?.dispose();
    textFieldPracaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
