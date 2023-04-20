import 'package:avaliacao_mobile/models/category.model.dart';
import 'package:avaliacao_mobile/repository/category.repository.dart';
import 'package:flutter/material.dart';

import '../models/tipo_transacao.model.dart';
import '../models/transaction.model.dart';
import '../repository/transaction.repository.dart';

class FormTransactionBloc extends ChangeNotifier {
  Transaction? transaction;
  List<Category> categories = [];

  TransactionRepository transactionRepository;
  CategoryRepository categoryRepository;

  FormTransactionBloc(
      {Transaction? transaction,
      required this.transactionRepository,
      required this.categoryRepository}) {
    if (transaction != null) {
      this.transaction = transaction;
    }
    this.transaction = Transaction(
      category: Category(name: ""),
      data: DateTime.now(),
      descricao: "",
      tipoTransacao: TipoTransacao.entrada,
      titulo: "",
      valor: 0.0,
    );
  }

  void getAllCategories() async {
    categories = await categoryRepository.getAllCategories();
    notifyListeners();
  }

  void salvar() async {
    if (transaction != null) {
      transactionRepository.addTransaction(transaction!);
    }
    transactionRepository.getAllTransactions();
    notifyListeners();
  }
}
