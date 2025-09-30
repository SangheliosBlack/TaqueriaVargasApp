import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taqueria_vargas/features/orders/domain/entities/order/order_entity.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/content/customer_order_profile_card.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/detail_order.dart';
import 'package:taqueria_vargas/features/orders/presentation/widgets/user_sale_detail.dart';

class DetailOrderInfo extends StatelessWidget {

  final OrderEntity order;

  const DetailOrderInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              "Detalle de la venta",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 24
              ),
            ),
            Divider(
              color: Colors.black.withValues(alpha: .1),
              height: 1,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    spacing: 12,
                    children: [
                      DetailOrder(
                        label: "Punto de venta", 
                        value: order.posStation.name, 
                        icon: Icons.point_of_sale
                      ),
                      DetailOrder(
                        label: "Tipo de venta", 
                        value: order.typeSale.description, 
                        icon: Icons.moped_sharp
                      ),
                      DetailOrder(
                        label: "Estatus", 
                        value: order.status.description, 
                        icon: Icons.schedule
                      ),
                    ],
                  ),
                  
                  // Nota del cliente en formato cuadro
                  if(order.note.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.note_alt,
                                  color: Colors.amber.shade700,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "Nota del cliente",
                                style: GoogleFonts.poppins(
                                  color: Colors.black.withValues(alpha: 0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.grey.shade100,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              order.note,
                              style: GoogleFonts.poppins(
                                color: Colors.black.withValues(alpha: 0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  
                  const Gap(20),
                  Text(
                    "Vendedor",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 24
                    ),
                  ),
                  const Gap(20),
                  Divider(
                    color: Colors.black.withValues(alpha: .1),
                    height: 1,
                  ),
                  const Gap(20),
                  UserSaleDetail(user: order.orderUser,),
                  const Gap(20),
                  if(order.customerOrder != null)
                    Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cliente",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 24
                          ),
                        ),
                        Divider(
                          color: Colors.black.withValues(alpha: .1),
                          height: 1,
                        ),
                        CustomerOrderProfileCard(user: order.customerOrder!,),
                      ],
                    ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );

  }

}