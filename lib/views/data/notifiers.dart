import 'package:flutter/foundation.dart';

// Notifier para manejar la página seleccionada en la navegación principal
class PageNotifier extends ChangeNotifier {
  int _selectedPage = 0;

  int get selectedPage => _selectedPage;

  void setPage(int page) {
    if (_selectedPage != page) {
      _selectedPage = page;
      notifyListeners();
    }
  }
}

// Notifier para manejar el estado de autenticación del usuario
class AuthNotifier extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userEmail;
  String? _userName;

  bool get isAuthenticated => _isAuthenticated;
  String? get userEmail => _userEmail;
  String? get userName => _userName;

  void login(String email, String name) {
    _isAuthenticated = true;
    _userEmail = email;
    _userName = name;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _userEmail = null;
    _userName = null;
    notifyListeners();
  }

  void updateUserInfo({String? email, String? name}) {
    if (email != null) _userEmail = email;
    if (name != null) _userName = name;
    notifyListeners();
  }
}

// Notifier para manejar el estado de carga global
class LoadingNotifier extends ChangeNotifier {
  bool _isLoading = false;
  String? _loadingMessage;

  bool get isLoading => _isLoading;
  String? get loadingMessage => _loadingMessage;

  void showLoading([String? message]) {
    _isLoading = true;
    _loadingMessage = message;
    notifyListeners();
  }

  void hideLoading() {
    _isLoading = false;
    _loadingMessage = null;
    notifyListeners();
  }
}

// Instancias globales de los notifiers
final pageNotifier = PageNotifier();
final authNotifier = AuthNotifier();
final loadingNotifier = LoadingNotifier();
