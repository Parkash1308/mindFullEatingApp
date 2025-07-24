// lib/services/auth_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_constant.dart';

class AuthService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.loginEndpoint}'), // Use baseUrl
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return {
        "success": true,
        "data": jsonDecode(response.body)
      };
    } else {
      return {
        "success": false,
        "message": jsonDecode(response.body)["message"] ?? "Login failed"
      };
    }
  }

  Future<Map<String, dynamic>> googleSignIn(String idToken) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.googleSignInEndpoint}'),
      headers: {
        'Content-Type': 'text/plain', // Backend expects text/plain for raw idToken
      },
      body: idToken, // Send the raw ID token string
    );

    if (response.statusCode == 200) {
      return {
        "success": true,
        "data": jsonDecode(response.body)
      };
    } else {
      return {
        "success": false,
        "message": jsonDecode(response.body)["message"] ?? "Google sign-in failed"
      };
    }
  }
}