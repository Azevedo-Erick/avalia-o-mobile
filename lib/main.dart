import 'package:avaliacao_mobile/blocs/form_transaction.bloc.dart';
import 'package:avaliacao_mobile/blocs/index_page.bloc.dart';
import 'package:avaliacao_mobile/blocs/transaction_details.bloc.dart';
import 'package:avaliacao_mobile/repository/category.repository.dart';
import 'package:avaliacao_mobile/repository/transaction.repository.dart';
import 'package:avaliacao_mobile/ui/screens/android/index_page.screen.dart';
import 'package:avaliacao_mobile/ui/themes/my_app.theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'db/hive_db.dart';
import 'models/category.model.dart';
import 'models/tipo_transacao.model.dart';
import 'models/transaction.model.dart';

Future<void> main() async {
  await HiveDB.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => IndexPageBloc(
              categoryRepository: CategoryRepository(),
              transactionRepository: TransactionRepository(),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => FormTransactionBloc(
              categoryRepository: CategoryRepository(),
              transactionRepository: TransactionRepository(),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => TransactionDetailsBloc(
                transactionRepository: TransactionRepository(),
                transaction: Transaction(
                  category: Category(name: ""),
                  data: DateTime.now(),
                  descricao: "",
                  tipoTransacao: TipoTransacao.entrada,
                  titulo: "",
                  valor: 0.0,
                )),
          ),
        ],
        child: MaterialApp(
          title: 'Spents App',
          debugShowCheckedModeBanner: false,
          theme: MyAppTheme.lightTheme,
          themeMode: ThemeMode.dark,
          darkTheme: MyAppTheme.darkTheme,
          home: const IndexPage(),
        ));
  }
}
