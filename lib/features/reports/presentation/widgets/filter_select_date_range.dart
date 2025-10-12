import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/config.dart';
import 'package:taqueria_vargas/features/reports/config/enums/date_filter_type.dart';
import 'package:taqueria_vargas/features/reports/presentation/providers/reports_provider.dart';

class FilterSelectDateRange extends ConsumerStatefulWidget {
  const FilterSelectDateRange({super.key});

  @override
  ConsumerState<FilterSelectDateRange> createState() => _FilterSelectDateRangeState();
}

class _FilterSelectDateRangeState extends ConsumerState<FilterSelectDateRange> {
  DateFilterType selectedFilter = DateFilterType.today;
  DateTimeRange? customDateRange;
  bool showCustomSelector = false;
  
  @override
  void initState() {
    super.initState();
    // Inicializar con el estado del provider
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final reportsState = ref.read(reportsProvider);
      setState(() {
        selectedFilter = reportsState.selectedDateFilterType;
        customDateRange = reportsState.customDateRange;
      });
    });
  }

  Future<void> _showCustomDatePicker() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(Duration(days: 365)),
      initialDateRange: customDateRange,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppTheme.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppTheme.primary,
              secondary: AppTheme.primary,
              onSecondary: Colors.white,
              surfaceContainerHighest: AppTheme.primary.withValues(alpha: 0.1),
              onSurfaceVariant: AppTheme.primary,
              outline: AppTheme.primary.withValues(alpha: 0.3),
              // Colores para la selección de rango
              primaryContainer: AppTheme.primary.withValues(alpha: 0.2),
              onPrimaryContainer: AppTheme.primary,
              secondaryContainer: AppTheme.primary.withValues(alpha: 0.15),
              onSecondaryContainer: AppTheme.primary,
              tertiaryContainer: AppTheme.primary.withValues(alpha: 0.1),
              onTertiaryContainer: AppTheme.primary,
            ),
            textTheme: Theme.of(context).textTheme.copyWith(
              headlineSmall: GoogleFonts.poppins(
                color: AppTheme.primary,
                fontWeight: FontWeight.w600,
              ),
              titleMedium: GoogleFonts.poppins(
                color: AppTheme.primary,
                fontWeight: FontWeight.w500,
              ),
              bodyLarge: GoogleFonts.poppins(
                color: AppTheme.primary,
              ),
              bodyMedium: GoogleFonts.poppins(
                color: AppTheme.primary,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
                textStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.primary,
                textStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        customDateRange = picked;
        selectedFilter = DateFilterType.custom;
        showCustomSelector = false;
      });
      _applyFilter();
    }
  }

  void _applyFilter() {

    if (selectedFilter == DateFilterType.custom && customDateRange != null) {

      ref.read(reportsProvider.notifier).applyDateFilterAndRefresh(
        DateFilterType.custom, 
        customDateRange
      );
    } else {
      
      ref.read(reportsProvider.notifier).applyDateFilterAndRefresh(selectedFilter);
    }
    
  }

  String _getCustomRangeText() {

    if (customDateRange == null) return 'Seleccionar fechas';
    
    final startDate = customDateRange!.start;
    final endDate = customDateRange!.end;
    
    return '${startDate.day}/${startDate.month} - ${endDate.day}/${endDate.month}';
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Container(
        width: 155,
        padding: EdgeInsets.symmetric(
          horizontal: 15, 
          vertical: 10
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              BootstrapIcons.calendar3,
              color: AppTheme.primary,
              size: 16,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                selectedFilter == DateFilterType.custom 
                    ? _getCustomRangeText()
                    : selectedFilter.label,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  color: AppTheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(width: 4),
            Icon(
              BootstrapIcons.chevron_down,
              color: AppTheme.primary,
              size: 12,
            ),
          ],
        ),
      ),
      offset: Offset(-2, 65),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      color: Colors.white,
      elevation: 0,
      itemBuilder: (context) => [
        // Opciones predeterminadas
        ...DateFilterType.values.where((type) => type != DateFilterType.custom).map(
          (type) => PopupMenuItem<String>(
            value: type.value,
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: SizedBox(
              width: 140,
              child: Row(
                children: [
                  Container(
                    width:  15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: selectedFilter == type 
                          ? AppTheme.primary 
                          : Colors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppTheme.primary,
                        width: 2,
                      ),
                    ),
                    child: selectedFilter == type
                        ? Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 10,
                          )
                        : null,
                  ),
                  SizedBox(width: 12),
                  Text(
                    type.label,
                    style: GoogleFonts.poppins(
                      color: AppTheme.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        
        // Divisor
        PopupMenuItem<String>(
          enabled: false,
          height: 20,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Divider(
            color: Colors.grey.withValues(alpha: 0.3),
            height: 0,
          ),
        ),
        
        // Opción personalizada
        PopupMenuItem<String>(
          height: 30,
          value: 'custom',
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: SizedBox(
            width: 140,
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: selectedFilter == DateFilterType.custom 
                        ? AppTheme.primary 
                        : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.primary,
                      width: 2,
                    ),
                  ),
                  child: selectedFilter == DateFilterType.custom
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 12,
                        )
                      : null,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Personalizado',
                        style: GoogleFonts.poppins(
                          color: AppTheme.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      if (selectedFilter == DateFilterType.custom && customDateRange != null)
                        Text(
                          _getCustomRangeText(),
                          style: GoogleFonts.poppins(
                            color: AppTheme.primary.withValues(alpha: 0.7),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      onSelected: (String value) {
        if (value == 'custom') {
          _showCustomDatePicker();
        } else {
          setState(() {
            selectedFilter = DateFilterType.fromValue(value);
          });
          _applyFilter();
        }
      },
    );
  }
}