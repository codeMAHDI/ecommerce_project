import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiClient {
  final String baseUrl;
  final http.Client _client;
  final Logger _logger;

  ApiClient({required this.baseUrl, http.Client? client})
    : _client = client ?? http.Client(),
      _logger = Logger();



  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _client.get(Uri.parse('$baseUrl$endpoint'));
      return _handleResponse(response);
    } catch (e) {
      _logger.e('GET request failed: $e');
      rethrow;
    }
  }

  Future<dynamic> post(
    String endpoint, {
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _client.post(Uri.parse('$baseUrl$endpoint'), body: jsonEncode(data), headers: {'Content-Type': 'application/json'},);
      return _handleResponse(response);
    } catch (e) {
      _logger.e('POST request failed: $e');
      rethrow;
    }
  }


  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      _logger.e('API Error: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
