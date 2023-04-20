import 'package:avaliacao_mobile/models/category.model.dart';
import 'package:avaliacao_mobile/repository/category.repository.dart';
import 'package:flutter/material.dart';

import '../models/transaction.model.dart';
import '../repository/transaction.repository.dart';

class TransactionDetailsBloc extends ChangeNotifier {
  Transaction transaction;

  TransactionRepository transactionRepository;

  TransactionDetailsBloc(
      {required this.transactionRepository, required this.transaction});

  void delete(String id) {
    transactionRepository.deleteTransaction(id);
  }
}
