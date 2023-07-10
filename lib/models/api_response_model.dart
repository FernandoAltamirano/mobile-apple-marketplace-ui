import 'package:apple_store_ui/models/models.dart';

class ApiResponse {
  final String message;
  final List<Product> data;

  ApiResponse({
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromMap(Map<String, dynamic> json) => ApiResponse(
        message: json["message"],
        data: List<Product>.from(json["data"].map((x) => Product.fromMap(x))),
      );
}
