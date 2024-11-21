import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/data/repository/auth_repository.dart';
import 'package:flutter_ecatalog/presentation/home_page.dart';

import 'bloc/login/login_bloc.dart';
import 'bloc/product/product_bloc.dart';
import 'bloc/register/register_bloc.dart';
import 'data/datasources/auth_datasource.dart';
import 'data/datasources/product_datasource.dart';
import 'data/repository/product_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(AuthRepository(AuthDatasource())),
        ),
        BlocProvider(
          create: (context) => LoginBloc(AuthRepository(AuthDatasource())),
        ),
        BlocProvider(
          create: (context) =>
              ProductBloc(ProductRepository(ProductDataSource())),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
