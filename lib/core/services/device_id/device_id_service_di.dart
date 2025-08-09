import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/core.dart';

final deviceIdServideDi = Provider<DeviceIdService>((ref) {

  final LocalStorageServiceImpl localStorageService = ref.read(localStorageServiceProvider);

  return DeviceIdServiceImpl(
    localStorageService: localStorageService,
  );

});