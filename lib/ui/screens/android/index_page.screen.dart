import 'package:avaliacao_mobile/blocs/index_page.bloc.dart';
import 'package:avaliacao_mobile/ui/screens/android/form_transaction.screen.dart';
import 'package:avaliacao_mobile/ui/screens/android/transaction_details.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/tipo_transacao.model.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<IndexPageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Visão Geral"),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FormTransactionScreen()))
                  },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Column(
          children: [
            Container(
              height: 90,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(children: [
                Text(
                  "Categorias",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () => {bloc.filter(bloc.categories[index])},
                            onDoubleTap: () => {bloc.disableFilters()},
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green),
                              child: Center(
                                  child: Text(bloc.categories[index].name)),
                            ),
                          ),
                      separatorBuilder: (context, index) =>
                          const Divider(color: Colors.grey),
                      itemCount: bloc.categories.length),
                ),
              ]),
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "Meus Gastos",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: ListView.separated(
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(4),
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1),
                                      boxShadow: const [],
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: bloc.transactions[index]
                                                        .tipoTransacao ==
                                                    TipoTransacao.entrada
                                                ? Colors.green
                                                : Colors.red,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(15))),
                                        child: Center(
                                          child: Icon(bloc.transactions[index]
                                                      .tipoTransacao ==
                                                  TipoTransacao.entrada
                                              ? Icons.add
                                              : Icons.remove),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                bloc.transactions[index].titulo,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                              Text(
                                                bloc.transactions[index]
                                                    .category.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                              Text(
                                                bloc.transactions[index].data
                                                    .toIso8601String(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => {
                                          bloc.delete(
                                              bloc.transactions[index].id)
                                        },
                                        child: Container(
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                          child: const Center(
                                            child: Icon(Icons.delete),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TransactionDetailsPage(
                                                transaction:
                                                    bloc.transactions[index],
                                              ),
                                            ),
                                          )
                                        },
                                        child: Container(
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(15),
                                                      bottomRight:
                                                          Radius.circular(15))),
                                          child: const Center(
                                            child: Icon(Icons.search),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              const Divider(color: Colors.grey, height: 16),
                          itemCount: bloc.transactions.length),
                    ),
                  )
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
