import 'package:taqueria_vargas/features/products/data/data.dart';
import 'package:taqueria_vargas/features/products/domain/repositories/products_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final productRepositoryDi = Provider<ProductsRepository>((ref){

  final remoteRepository = ref.read(productsRemoteDataSourceDi);

  return ProductsRepositoryImpl(remoteDataSource: remoteRepository);

});