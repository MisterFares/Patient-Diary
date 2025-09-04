// lib/core/services/auth_service.dart
import 'package:project/core/services/local_storage_service.dart';

class AuthService {
  static Future<bool> isLoggedIn() async {
    return LocalStorageService.sessionBox.get('isLoggedIn', defaultValue: false);
  }

  static Future<void> login(String phoneNumber) async {
    // Mock authentication - just store session
    await LocalStorageService.sessionBox.put('isLoggedIn', true);
    await LocalStorageService.sessionBox.put('phoneNumber', phoneNumber);
  }

  static Future<void> logout() async {
    await LocalStorageService.sessionBox.clear();
  }

  static Future<bool> verifyOtp(String otp) async {
    // Mock verification - accept any 6-digit code
    return otp.length == 6 && int.tryParse(otp) != null;
  }
}