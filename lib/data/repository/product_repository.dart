import 'package:dartz/dartz.dart';

import '../datasources/product_datasource.dart';
import '../models/response/product_response_model.dart';

class ProductRepository {
  final ProductDataSource dataSource;

  ProductRepository(this.dataSource);

  Future<Either<String, List<ProductResponseModel>>> getAllProducts() {
    return dataSource.getAllProducts();
  }
}
