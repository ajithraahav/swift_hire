import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  // Sign up with email and password
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    // Your sign-up logic here
    await _storage.write(key: 'email', value: email);
    await _storage.write(key: 'password', value: password);
  }

  // Sign in with email and password
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    // Your sign-in logic here
    String? storedEmail = await _storage.read(key: 'email');
    String? storedPassword = await _storage.read(key: 'password');
    if (email == storedEmail && password == storedPassword) {
      return true;
    } else {
      return false;
    }
  }

  // Sign out
  Future<void> signOut() async {
    // Your sign-out logic here
    await _storage.deleteAll();
  }
}

// Usage:
// AuthService authService = AuthService();
// bool isAuthenticated = await authService.signInWithEmailAndPassword(email, password);
// if (isAuthenticated) {
//   // Authentication successful, navigate to next screen
// } else {
//   // Authentication failed, show error message
// }
