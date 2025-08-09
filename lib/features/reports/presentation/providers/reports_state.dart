import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_entity.dart';

class ReportsState {

  final bool isLoading;
  final List<PosStationEntity> list;

  ReportsState({
    this.isLoading = true,
    this.list = const []
  }); 

  ReportsState copyWith({
    bool? isLoading,
    List<PosStationEntity>? list
  }) {
    return ReportsState(
      isLoading: isLoading ?? this.isLoading,
      list: list ?? this.list
    );
  }

}