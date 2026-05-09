import 'package:flutter/material.dart';
import 'package:wealth_wave/features/home/data/models/transaction.dart';
import 'package:wealth_wave/features/home/domain/repository/transaction_repository.dart';
import 'package:wealth_wave/features/home/presentation/bloc/home_state.dart';

class HomeController extends ChangeNotifier {
  final TransactionRepository _transactionRepository;
  HomeState _state = HomeInitialState();

  HomeController(this._transactionRepository);

  HomeState get state => _state;

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  List<Transaction> _transactions = [];
  List<Transaction> get transactions => _transactions;

  Future<void> getAllTransactions() async {
    _changeState(HomeLoadingState());
    try {
      _transactions = await _transactionRepository.getAllTransactions();
      _changeState(HomeSuccessState());
    } catch (error) {
      _changeState(HomeErrorState(error.toString()));
    }
  }
}
