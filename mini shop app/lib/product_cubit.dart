import 'package:flutter_bloc/flutter_bloc.dart';
import 'api_service.dart';

abstract class ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<dynamic> products;

  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}

class ProductCubit extends Cubit<ProductState> {
  final ApiService apiService;

  ProductCubit(this.apiService) : super(ProductLoading()) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await apiService.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError("Failed to fetch products: $e"));
    }
  }
}
