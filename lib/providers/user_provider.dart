import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motoradar/services/firebase_service.dart';

class UserProvider extends ChangeNotifier {
  User? _currentUser;
  Map<String, dynamic> _userProfile = {};
  bool _isLoading = false;
  String? _error;
  final bool firebaseEnabled;

  User? get currentUser => _currentUser;
  Map<String, dynamic> get userProfile => _userProfile;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _currentUser != null;

  UserProvider({required this.firebaseEnabled}) {
    if (firebaseEnabled) {
      _initializeAuth();
    }
  }

  void _initializeAuth() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _currentUser = user;
      if (user != null) {
        _loadUserProfile(user.uid);
      } else {
        _userProfile = {};
      }
      notifyListeners();
    });
  }

  Future<void> _loadUserProfile(String uid) async {
    try {
      _userProfile = await FirebaseService.getUserProfile(uid);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<bool> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await FirebaseService.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName,
      );

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await FirebaseService.signInWithEmail(
        email: email,
        password: password,
      );

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseService.signOut();
      _currentUser = null;
      _userProfile = {};
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
