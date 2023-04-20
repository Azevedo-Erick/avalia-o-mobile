import 'package:hive_flutter/hive_flutter.dart';

import '../models/category.model.dart';
import '../models/tipo_transacao.model.dart';
import '../models/transaction.model.dart';
import 'adapters/category.adapter.dart';
import 'adapters/tipo_transacao.adapter.dart';
import 'adapters/transaction.adapter.dart';
import 'package:path_provider/path_provider.dart';

class HiveDB {
  static Future<void> init() async {
    final appDocumentsDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter("${appDocumentsDirectory.path}/hive_data");
    Hive.registerAdapter<Transaction>(TransactionAdapter());
    Hive.registerAdapter<Category>(CategoryAdapter());
    Hive.registerAdapter<TipoTransacao>(TipoTransacaoAdapter());

    await Hive.openBox<Transaction>("transactions");
    await Hive.openBox<Category>('categories');
    await seed();
  }

  static Future<void> seed() async {
    Box<Transaction> transactionBox = Hive.box<Transaction>('transactions');
    Box<Category> categoryBox = Hive.box<Category>('categories');
    if (transactionBox.isEmpty) {
      List<Transaction> transactions = [
        Transaction(
            titulo: "Netflix",
            descricao: "Assinatura mensal do Netflix",
            valor: 29.90,
            tipoTransacao: TipoTransacao.gasto,
            data: DateTime.parse("2023-04-15"),
            category: Category(name: "Entretenimento")),
        Transaction(
            titulo: "Salário",
            descricao: "Recebimento do salário referente ao mês de abril",
            valor: 5000.00,
            tipoTransacao: TipoTransacao.entrada,
            data: DateTime.parse("2023-04-05"),
            category: Category(name: "Salário")),
        Transaction(
            titulo: "Supermercado",
            descricao: "Compra de mantimentos para a casa",
            valor: 250.80,
            tipoTransacao: TipoTransacao.gasto,
            data: DateTime.parse("2023-04-12"),
            category: Category(name: "Alimentação")),
        Transaction(
            titulo: "Uber",
            descricao: "Viagem de Uber do trabalho para casa",
            valor: 20.50,
            tipoTransacao: TipoTransacao.gasto,
            data: DateTime.parse("2023-04-09"),
            category: Category(name: "Transporte")),
        Transaction(
            titulo: "Cinema",
            descricao: "Ingresso para assistir o filme 'Vingadores: Ultimato'",
            valor: 35.00,
            tipoTransacao: TipoTransacao.gasto,
            data: DateTime.parse("2023-04-20"),
            category: Category(name: "Entretenimento")),
        Transaction(
            titulo: "Luz",
            descricao: "Conta de luz referente ao mês de março",
            valor: 120.00,
            tipoTransacao: TipoTransacao.gasto,
            data: DateTime.parse("2023-04-01"),
            category: Category(name: "Contas")),
        Transaction(
            titulo: "Freelance",
            descricao: "Pagamento por um trabalho freelance realizado",
            valor: 800.00,
            tipoTransacao: TipoTransacao.entrada,
            data: DateTime.parse("2023-04-14"),
            category: Category(name: "Trabalho")),
        Transaction(
            titulo: "Restaurante",
            descricao: "Almoço em um restaurante",
            valor: 45.00,
            tipoTransacao: TipoTransacao.gasto,
            data: DateTime.parse("2023-04-07"),
            category: Category(name: "Alimentação")),
        Transaction(
            titulo: "Internet",
            descricao:
                "Pagamento da conta de internet referente ao mês de abril",
            valor: 89.90,
            tipoTransacao: TipoTransacao.gasto,
            data: DateTime.parse("2023-04-10"),
            category: Category(name: "Contas")),
        Transaction(
            titulo: "Presente",
            descricao: "Compra de presente para aniversário de um amigo",
            valor: 80.00,
            tipoTransacao: TipoTransacao.gasto,
            data: DateTime.parse("2023-04-18"),
            category: Category(name: "Presentes"))
      ];
      for (var element in transactions) {
        await transactionBox.add(element);
      }
    }
    if (categoryBox.isEmpty) {
      List<Category> categories = [
        Category(name: "Diversão"),
        Category(name: "Transporte"),
        Category(name: "Alimentação"),
        Category(name: "Limpeza"),
      ];
      for (var element in categories) {
        await categoryBox.add(element);
      }
    }
  }
}
