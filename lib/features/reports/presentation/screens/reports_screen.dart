import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/auth/presentation/providers/auth_provider.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/providers/point_of_sale_provider.dart';
import 'package:taqueria_vargas/features/reports/domain/entities/pos_station_entity.dart';
import 'package:taqueria_vargas/features/reports/presentation/providers/reports_provider.dart';
import 'package:taqueria_vargas/features/shared/shared.dart';

class ReportsScreen extends ConsumerStatefulWidget {

  static const String path = "/point-of-sale/reports";

  const ReportsScreen({super.key});

  @override
  ConsumerState<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ConsumerState<ReportsScreen> {

    @override
  void initState() {

    super.initState();

     Future.microtask(() {
      ref.read(reportsProvider.notifier).fetchAllTurns();
    });

  }

  @override
  Widget build(BuildContext context) {

    final reportsState = ref.watch(reportsProvider);

    return Container(
      color: AppTheme.backgroundColor,
      child: CoolDataTable<PosStationEntity>(
        title: "Turnos",
        onRefresh: () {
          
          ref.read(reportsProvider.notifier).fetchAllTurns();

        },
        isSelectable: false,
        isLoading: reportsState.isLoading,
        data: reportsState.list,
        cellsPerPage: [
          20, 30, 50, 100
        ],
        onRowTap: (PosStationEntity item) {},
        totalDocuments: 126,
        headers: [
          RowHeader(
            title: 'Inicio',
            alignment: Alignment.centerRight,
            width: 130,
          ),
          RowHeader(
            title: 'Cerrado',
            alignment: Alignment.centerRight,
            width: 100,
          ),
          RowHeader(
            title: 'Estatus', 
            alignment: Alignment.center,
            width: 80,
          ),
          RowHeader(
            title: 'Creado',
            alignment: Alignment.centerRight,
          ),
          RowHeader(
            title: 'POS',
            alignment: Alignment.centerRight,
            width: 100,
          ),
        ],
        buildRow: (PosStationEntity turn) {
          return [
            RowCell(
              width: 130,
              text: DatesFormat(turn.openingDate).formatoFechaHora,
              alignment: Alignment.centerRight,
            ),
            RowCell(
              text: turn.closedBy?.fullName ?? '---',
              alignment: Alignment.centerRight,
              width: 100,
            ),
            Container(
              decoration: BoxDecoration(
                color: turn.active ? AppTheme.primary :Colors.transparent,
                borderRadius: BorderRadius.circular(100),
              ),
              width: 80,
              child: Center(
                child: Text(
                  turn.active ? 'Abierto' : 'Cerrado',
                   style: GoogleFonts.poppins(
                    color: turn.active ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w300
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Offstage(
              offstage: !turn.active,
              child: AnimatedOpacity(
                opacity: turn.posActive == turn.shiftStations.length ? 1 : 0.5,
                duration: Duration(milliseconds: 300),
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 110,
                  child: Row(
                    children: [
                      Container(
                        width:  3,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          shape: BoxShape.circle
                        ),
                      ),
                      Container(
                        width:  20,
                        height: 2,
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withValues(alpha: .2),
                        ),
                      ),
                      Container(
                        width:  3,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          shape: BoxShape.circle
                        ),
                      ),
                      Gap(10),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {

                          if(turn.posActive < turn.shiftStations.length){

                            MessageServiceImpl().showBottom(
                              context: context,
                              title: "Error al cerrar el turno",
                              message: "Para cerrar el turno debes tener todos tus puntos de venta cerrados",
                              backgroundColor: AppTheme.delete
                            );

                            return;

                          }

                          ref.read(pointOfSaleProvider.notifier).closeTurn(context: context, turnId: turn.id);

                        },
                        child: Text(
                          turn.posActive == turn.shiftStations.length  ? 'Cerrar' : 'Cerrar',
                           style: GoogleFonts.poppins(
                            color: turn.posActive == turn.shiftStations.length ? AppTheme.primary : Colors.black,
                            fontWeight: FontWeight.w300
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right_sharp,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
            RowCell(
              text: turn.createdBy.fullName,
              alignment: Alignment.centerRight,
            ),
            RowCell(
              text: "${turn.posActive.toString()}/${turn.shiftStations.length}",
              alignment: Alignment.centerRight,
              width: 100,
            ),
          ];
        },
      ),
    );
  }
}
