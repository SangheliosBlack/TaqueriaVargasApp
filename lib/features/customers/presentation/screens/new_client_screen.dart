import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taqueria_vargas/core/core.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddNewClientScreen extends ConsumerWidget {

  static const String path = "/point-of-sale/clients/add-new-client";

  const AddNewClientScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left:  0,
          right: 0,
          top: 20,
          bottom: 20
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width: context.width * .5,
                      child: Column(
                        children: [
                          ClientsHeader(),
                          SearchClientWidget(),
                        ],
                      ),
                    ),
                    Divider(color: AppTheme.primary,height: 10),
                    Gap(15),
                    Container(
                      width: context.width * .5,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20,
                        children: [
                          ClientDialogNameField(),
                          ClientDialogPhoneField(),
                          ClientDialogAddressField(),
                          Column(
                            spacing:0,
                            children: [
                              ClientDialogReferenceField(),
                              ClientsDialogButtons(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}