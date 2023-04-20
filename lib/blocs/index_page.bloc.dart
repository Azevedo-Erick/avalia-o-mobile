import 'package:avaliacao_mobile/models/category.model.dart';
import 'package:avaliacao_mobile/repository/category.repository.dart';
import 'package:flutter/material.dart';

import '../models/transaction.model.dart';
import '../repository/transaction.repository.dart';

class IndexPageBloc extends ChangeNotifier {
  List<Transaction> transactions = [];
  List<Transaction> _transactionsDataSource = [];
  List<Category> categories = [];

  TransactionRepository transactionRepository;
  CategoryRepository categoryRepository;

  IndexPageBloc(
      {required this.transactionRepository, required this.categoryRepository}) {
    getAllTransactions();
    getAllCategories();
  }

  void getAllTransactions() async {
    _transactionsDataSource = await transactionRepository.getAllTransactions();
    transactions = _transactionsDataSource;
    notifyListeners();
  }

  void filter(Category category) {
    transactions = _transactionsDataSource
        .where((element) => element.category.name == category.name)
        .toList();
    notifyListeners();
  }

  void disableFilters() {
    getAllTransactions();
    notifyListeners();
  }

  void getAllCategories() async {
    categories = await categoryRepository.getAllCategories();
    notifyListeners();
  }

  void delete(String id) {
    transactionRepository.deleteTransaction(id);
    getAllTransactions();
  }
}
