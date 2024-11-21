import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/response/product_response_model.dart';
import '../../data/repository/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  ProductBloc(this.repository) : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoading());
      final result = await repository.getAllProducts();
      result.fold(
        (error) => emit(ProductError(message: error)),
        (data) => emit(ProductLoaded(products: data)),
      );
    });
  }
}
