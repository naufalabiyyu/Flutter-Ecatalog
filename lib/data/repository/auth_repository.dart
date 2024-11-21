import 'package:dartz/dartz.dart';
import 'package:flutter_ecatalog/data/datasources/auth_datasource.dart';
import 'package:flutter_ecatalog/data/models/request/login_request_model.dart';
import 'package:flutter_ecatalog/data/models/request/register_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/login_response_model.dart';
import 'package:flutter_ecatalog/data/models/response/register_response_model.dart';

class AuthRepository {
  final AuthDatasource datasource;

  AuthRepository(this.datasource);

  Future<Either<String, LoginResponseModel>> login(LoginRequestModel model) {
    return datasource.login(model);
  }

  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel model) {
    return datasource.register(model);
  }
}
