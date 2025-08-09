import 'package:taqueria_vargas/features/products/data/data_sources/data_sources.dart';
import 'package:taqueria_vargas/features/products/data/mappers/category_mapper.dart';
import 'package:taqueria_vargas/features/products/domain/domain.dart';
import 'package:taqueria_vargas/core/resources/data_state.dart';


class ProductsRepositoryImpl implements ProductsRepository{

  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DataState<List<CategoryEntity>>> fetchAllProducts() async {

    final remoteResponse = await remoteDataSource.fetchAllProducts();

     if(remoteResponse is DataSuccess){

      final responseToEntity = CategoryMapper.fromDtoList(dtoList: remoteResponse.data!.products);

      return DataSuccess(responseToEntity);

    }

    return DataFailed(remoteResponse.error!);


  }



}