import 'package:wealth_wave/features/home/data/models/transaction.dart';
import 'package:wealth_wave/features/home/domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<void> addTransaction() {
    // Simulate adding a transaction (e.g., to a database or API)
    return Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<List<Transaction>> getAllTransactions() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return [
      Transaction(
        title: 'Transaction 1',
        amount: 482.49,
        date: DateTime.now().add(Duration(days: -1)),
      ),
      Transaction(
        title: 'Transaction 2',
        amount: -471.18,
        date: DateTime.now().add(Duration(days: -2)),
      ),
      Transaction(
        title: 'Transaction 3',
        amount: -851.19,
        date: DateTime.now().add(Duration(days: -3)),
      ),
      Transaction(
        title: 'Transaction 4',
        amount: 917.59,
        date: DateTime.now().add(Duration(days: -4)),
      ),
    ];
  }
}
