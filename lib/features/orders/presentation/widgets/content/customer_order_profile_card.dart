import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/core/config/themes/main_theme.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/customer_order_entity.dart';


class CustomerOrderProfileCard extends StatelessWidget {

  final CustomerOrderEntity user;

  const CustomerOrderProfileCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con avatar y nombre
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName ?? 'Cliente sin nombre',
                      style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 22
              ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ID: ${user.id?.toString() ?? 'N/A'}',
                      style: GoogleFonts.poppins(
                        color: Colors.black.withValues(alpha: 0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          // Listado de características
          Text(
            'Información del Cliente',
            style: GoogleFonts.poppins(
              color: Colors.black.withValues(alpha: 0.8),
              fontSize: 16,
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Características
          _buildCharacteristicItem(
            icon: Icons.phone,
            label: 'Teléfono',
            value: user.phone ?? 'No registrado',
          ),
          
          const SizedBox(height: 12),
          
          _buildCharacteristicItem(
            icon: Icons.location_on,
            label: 'Dirección',
            value: user.address ?? 'No registrada',
          ),
          
          const SizedBox(height: 12),
          
          _buildCharacteristicItem(
            icon: Icons.info_outline,
            label: 'Referencias',
            value: user.references ?? 'Sin referencias',
          ),
        ],
      ),
    );

  }

  Widget _buildCharacteristicItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: AppTheme.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: Colors.black.withValues(alpha: 0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: GoogleFonts.poppins(
                  color: Colors.black.withValues(alpha: 0.8),
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
