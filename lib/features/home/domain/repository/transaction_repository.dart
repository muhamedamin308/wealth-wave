import 'package:wealth_wave/features/home/data/models/transaction.dart';

abstract class TransactionRepository {
  Future<void> addTransaction();
  Future<List<Transaction>> getAllTransactions();
}


