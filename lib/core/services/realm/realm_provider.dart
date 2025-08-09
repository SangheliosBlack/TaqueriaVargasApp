import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/services/realm/realm_implementation.dart';

final realmServiceProvider = Provider<RealmServiceImplementation>((ref) {

  final realmService = RealmServiceImplementation();
  
  realmService.initService();

  ref.onDispose(() => realmService.close());

  return realmService;
  
});
