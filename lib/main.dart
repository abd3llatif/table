import 'package:flutter/material.dart';
import 'package:table/table_page.dart';

import 'models/operation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final List<Operation> operations = [
    Operation(name: 'CONTROLE DU REGLAGE DE LA TEMPERATURE (2<TEMP<8)', conforme: false, intervention: null),
    Operation(name: 'NETTOYAGE DE L\'EQUPEMENT (INTERIEURE ET EXTERIEUR)', conforme: false, intervention: null),
    Operation(name: 'NETTOYAGE DE L\'EQUPEMENT (INTERIEURE ET EXTERIEUR)', conforme: false, intervention: null),
    Operation(name: 'NETTOYAGE DE L\'EQUPEMENT (INTERIEURE ET EXTERIEUR)', conforme: false, intervention: null),
    Operation(name: 'NETTOYAGE DE L\'EQUPEMENT (INTERIEURE ET EXTERIEUR)', conforme: false, intervention: null),
    Operation(name: 'NETTOYAGE DE L\'EQUPEMENT (INTERIEURE ET EXTERIEUR)', conforme: false, intervention: null),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TablePage(operations),
    );
  }
}