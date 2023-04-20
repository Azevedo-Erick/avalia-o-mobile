import 'package:avaliacao_mobile/models/transaction.model.dart';
import 'package:flutter/material.dart';

import '../../../models/tipo_transacao.model.dart';

class TransactionDetailsPage extends StatelessWidget {
  final Transaction transaction;
  const TransactionDetailsPage({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detalhes da Transação"),
          actions: const [],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(18)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(transaction.titulo),
                      Text(transaction.category.name),
                    ],
                  ),
                  Column(
                    children: [
                      Text(transaction.data.toIso8601String()),
                      Text("R\$ ${transaction.valor.toStringAsFixed(2)}"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Text(transaction.descricao),
            ),
            Container(
              decoration: BoxDecoration(
                  color: transaction.tipoTransacao == TipoTransacao.entrada
                      ? Colors.green
                      : Colors.red,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              height: 70,
              child: Center(
                  child: Text(transaction.tipoTransacao.name.toUpperCase())),
            ),
          ],
        ));
  }
}
