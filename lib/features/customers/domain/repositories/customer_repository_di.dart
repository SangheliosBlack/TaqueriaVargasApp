import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:taqueria_vargas/features/customers/data/data.dart';
import 'package:taqueria_vargas/features/customers/domain/domain.dart';

final customersRespositoryDi = Provider<CustomersRepository>((ref){

  final CustomersRemoteDataSource remoteDataSource = ref.read(customersRemoteDataSourceDi);

  return CustomersRepositoryImpl(remoteDataSource: remoteDataSource);

});