import 'package:controle_container/flutter_flow/flutter_flow_icon_button.dart';
import 'package:controle_container/flutter_flow/flutter_flow_theme.dart';
import 'package:controle_container/flutter_flow/flutter_flow_util.dart';
import 'package:csv/csv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../app_state.dart';
import '../flutter_flow/flutter_flow_model.dart';
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

  Future<void> exportFirestoreDataToCSV() async {
    try {
      // Inicializa o Firebase, se ainda não estiver inicializado
      await Firebase.initializeApp();

      // Obter uma referência para a coleção Firestore que você deseja baixar
      CollectionReference collectionRef =
          FirebaseFirestore.instance.collection('users');

      // Obter todos os documentos da coleção
      QuerySnapshot querySnapshot = await collectionRef.get();

      // Defina os cabeçalhos das colunas no CSV
      List<List<dynamic>> rows = [
        ['display_name', 'email', 'uid'],
      ]; // Adicione seus campos aqui

      // Preencha os dados no CSV
      List<QueryDocumentSnapshot> documents = querySnapshot.docs;
      for (var doc in documents) {
        rows.add([doc['display_name'], doc['email'], doc['uid']]);
      }

      // Obtenha o diretório DCIM do dispositivo
      Directory? dcimDirectory = await getExternalStorageDirectory();
      String? dcimPath = dcimDirectory?.path;

      // Salve o arquivo CSV na pasta DCIM com um nome exclusivo
      String csvFileName = 'exported_data.csv';
      String csvFilePath = '$dcimPath/$csvFileName';
      String csv = const ListToCsvConverter().convert(rows);
      File(csvFilePath).writeAsStringSync(csv);

      // Exibir uma mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dados exportados para $csvFileName na pasta DCIM'),
          duration: Duration(seconds: 3),
        ),
      );
    } catch (e) {
      // Exibir mensagem de erro, caso ocorra um problema
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao exportar dados: ${e.toString()}'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(5),
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
                  padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  child: Container(
                    width: 50,
                    height: 50,
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
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'Controle de Containers',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Fonte Tecadi',
                          color: FlutterFlowTheme.of(context).azulPadrao,
                          fontSize: 18,
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
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 50,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.cloud_download,
                      color: FlutterFlowTheme.of(context).azulPadrao,
                      size: 20,
                    ),
                    showLoadingIndicator: true,
                    onPressed: () async {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Baixar base de dados'),
                                content:
                                    Text('Deseja realmente baixar o arquivo?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Confirmar'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        await exportFirestoreDataToCSV();
                      } else {
                        return;
                      }
                    },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.8, 0.85),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.white,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 50,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.playlist_add_sharp,
                      color: FlutterFlowTheme.of(context).azulPadrao,
                      size: 30,
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
