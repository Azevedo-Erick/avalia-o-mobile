import 'package:avaliacao_mobile/models/transaction.model.dart';
import 'package:hive/hive.dart';

class TransactionRepository {
  TransactionRepository();

  final Box<Transaction> _transactionBox =
      Hive.box<Transaction>('transactions');
  Future<void> addTransaction(Transaction transaction) async {
    await _transactionBox.add(transaction);
  }

  Future<bool> deleteTransaction(String id) async {
    final key = _transactionBox.keys.firstWhere(
        (key) => _transactionBox.get(key)?.id == id,
        orElse: () => null);
    if (key != null) {
      await _transactionBox.delete(key);
      return true;
    }
    return false;
  }

  Future<Transaction?> getById(String id) async {
    final key = _transactionBox.keys.firstWhere(
        (key) => _transactionBox.get(key)?.id == id,
        orElse: () => null);
    return _transactionBox.get(key);
  }

  Future<void> updateTransaction(int index, Transaction transaction) async {
    await _transactionBox.putAt(index, transaction);
  }

  Future<List<Transaction>> getAllTransactions() async {
    final List<Transaction> transactions = _transactionBox.values.toList();

    return transactions;
  }
}
