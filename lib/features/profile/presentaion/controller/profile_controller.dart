import 'package:flutter/material.dart';
import 'package:wealth_wave/features/auth/data/data_source/secure_storage.dart';
import 'package:wealth_wave/features/profile/presentaion/bloc/profile_state.dart';
import 'package:wealth_wave/services/auth_service.dart';

class ProfileController extends ChangeNotifier {
  final AuthService _authService;
  final SecureStorage _secureStorage;

  ProfileController(this._authService, this._secureStorage);

  ProfileState _state = ProfileInitialState();
  ProfileState get state => _state;

  void _changeState(ProfileState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> logout() async {
    _changeState(ProfileLoadingState());
    try {
      await _authService.signOut();
      await _secureStorage.deleteAll();
      _changeState(ProfileSuccessState());
      return true;
    } catch (e) {
      _changeState(ProfileErrorState(e.toString()));
      return false;
    }
  }
}
