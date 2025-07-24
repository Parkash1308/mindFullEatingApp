// lib/services/api_constant.dart
import 'package:flutter/foundation.dart'; // Import for kIsWeb

class ApiConstants {
  // Use 10.0.2.2 for Android emulator, localhost for iOS simulator
  // On real devices, you'll need your server's public IP or domain.
  static const String _androidEmulatorIp = "http://10.0.2.2:8080";
  static const String _iosSimulatorIp = "http://localhost:8080"; // Or your machine's IP if localhost doesn't work
  static const String _webLocalhost = "http://localhost:8080";

  // Determine base URL based on platform
  static String get baseUrl {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return _androidEmulatorIp;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return _iosSimulatorIp;
    } else if (kIsWeb) {
      return _webLocalhost; // For Flutter Web
    }
    return "http://localhost:8080"; // Default or fallback, consider using your actual machine IP for physical devices
  }

  static const String loginEndpoint = "/api/user/signin";
  static const String googleSignInEndpoint = "/api/user/google-signin"; // New endpoint for Google Sign-In
}