import 'package:bytebank/screens/formulario_transfererncia.dart';
import 'package:flutter/material.dart';

const _textappbar = Text('ByteBank Transferencias');
const _textfloatbuttom = Text('Transação');

class TransferenceLIst extends StatefulWidget {
  TransferenceLIst({Key? key}) : super(key: key);

  final List<Transf?> transflista = [];

  @override
  State<StatefulWidget> createState() {
    return TransferenceLIstState();
  }
}

class TransferenceLIstState extends State<TransferenceLIst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: _textappbar,
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
      body: ListView.builder(
        itemCount: widget.transflista.length,
        itemBuilder: (context, index) {
          final transf = widget.transflista[index];

          return ListItem(transf!);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.attach_money_sharp),
        label: _textfloatbuttom,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {
          final Future<Transf?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormTransfer();
          }));
          future.then((transferenciaC) {
            Future.delayed(const Duration(microseconds: 500), () {
              if (transferenciaC != null) {
                setState(() {
                  widget.transflista.add(transferenciaC);
                  debugPrint('$transferenciaC');
                });
              }
            });
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class ListItem extends StatelessWidget {
  final Transf _transf;

  ListItem(this._transf);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: const Icon(Icons.monetization_on_outlined),
        title: Text(
          _transf.transferquant.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(_transf.moneyinbank.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            )),
      ),
    );
  }
}

class Transf {
  final int transferquant;
  final double moneyinbank;

  Transf(this.transferquant, this.moneyinbank);

  @override
  String toString() {
    return 'Tranf {transferquant:$transferquant, moneyinbank:$moneyinbank}';
  }
}
