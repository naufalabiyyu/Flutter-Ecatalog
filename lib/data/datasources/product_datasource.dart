import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../models/response/product_response_model.dart';

class ProductDataSource {
  Future<Either<String, List<ProductResponseModel>>> getAllProducts() async {
    final response = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/products/'),
    );

    if (response.statusCode == 200) {
      return Right(
        List<ProductResponseModel>.from(
          json.decode(response.body).map(
                (x) => ProductResponseModel.fromMap(x),
              ),
        ),
      );
    } else {
      return const Left("Failed to get products");
    }
  }
}
