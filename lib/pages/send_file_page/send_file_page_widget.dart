import 'dart:convert';
import 'dart:io';

import '/components/topo_voltar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'send_file_page_model.dart';
export 'send_file_page_model.dart';

class SendFilePageWidget extends StatefulWidget {
  const SendFilePageWidget({Key? key}) : super(key: key);

  @override
  _SendFilePageWidgetState createState() => _SendFilePageWidgetState();
}

class _SendFilePageWidgetState extends State<SendFilePageWidget> {
  late SendFilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  get excel => null;

  get http => null;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SendFilePageModel());

    _model.textFieldSendEmailController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.topoVoltarModel,
                updateCallback: () => setState(() {}),
                child: TopoVoltarWidget(),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                child: Text(
                  'Enviar base de dados por e-mail',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 18,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: TextFormField(
                  controller: _model.textFieldSendEmailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Insira seu email',
                    hintStyle: FlutterFlowTheme.of(context).bodyLarge,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF808080),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    filled: true,
                  ),
                  style: FlutterFlowTheme.of(context).bodyLarge,
                  validator: _model.textFieldSendEmailControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 32, 16, 32),
                child: FFButtonWidget(
                  onPressed: () async {
                    exportDataToExcel(_model.textFieldSendEmailController.text);
                  },
                  text: 'Enviar arquivo',
                  options: FFButtonOptions(
                    width: 175,
                    height: 50,
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).info,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                    elevation: 2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void exportDataToExcel(String recipientEmail) async {
    // Recupere e converta os dados para o formato Excel (conforme mostrado anteriormente)

    // Salve o arquivo Excel temporariamente
    final bytes = await excel.encode();
    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/data.xlsx';
    final file = File(filePath);
    await file.writeAsBytes(bytes);

    // Configure os detalhes do e-mail e do envio usando o SendGrid
    final apiKey = 'YOUR_SENDGRID_API_KEY';
    final apiUrl = 'https://api.sendgrid.com/v3/mail/send';
    final senderEmail = 'your-email@example.com';
    final subject = 'Dados Exportados';

    // Crie o objeto de e-mail com os detalhes do remetente, destinatário e assunto
    final email = {
      'personalizations': [
        {
          'to': [
            {'email': recipientEmail}
          ]
        }
      ],
      'from': {'email': senderEmail},
      'subject': subject,
      'content': [
        {'type': 'text/plain', 'value': 'Veja os dados exportados em anexo.'}
      ],
      'attachments': [
        {
          'content': base64Encode(file.readAsBytesSync()),
          'filename': 'data.xlsx'
        }
      ]
    };

    // Envie o e-mail usando a API do SendGrid
    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(email));

    if (response.statusCode == 202) {
      print('E-mail enviado com sucesso!');
    } else {
      print(
          'Erro ao enviar o e-mail. Código de status: ${response.statusCode}');
    }
  }

  getTemporaryDirectory() {}
}
