
import 'package:bytebank/screens/transferencia_lista.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const _textappbarformulario = Text('Formulário de transferencia');
const _textbuttomformulario = Text('Transferir');

class FormTransfer extends StatelessWidget {
  FormTransfer({Key? key}) : super(key: key);

  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _textappbarformulario,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green, Colors.lightBlue],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.elliptical(50, 50),
          ),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: 'Numero da Conta',
              dica: '0000',
            ),
            Editor(
                controlador: _controladorCampoValor,
                rotulo: 'Valor',
                dica: '000.0',
                icone: Icons.monetization_on),
            ElevatedButton(
                onPressed: () {
                  _criarTransferencia(context);
                },
                child: _textbuttomformulario),
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int numeroConta = int.parse(_controladorCampoNumeroConta.text);
    final double valor = double.parse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final Transf transferenciaCriada = Transf(numeroConta, valor);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  IconData? icone = null;

  Editor({
    Key? key,
    required this.controlador,
    required this.rotulo,
    required this.dica,
    this.icone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controlador,
          style: const TextStyle(
            fontSize: 24.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
              icon: icone != null ? Icon(icone) : null,
              labelText: rotulo,
              hintText: dica),
          keyboardType: TextInputType.number,
        ));
  }
}
