import 'package:flutter/material.dart';
import 'package:taqueria_vargas/features/point_of_sale/presentation/widgets/header_search_bar/header_search_bar.dart';

class HeaderSearchBar extends StatelessWidget {

  const HeaderSearchBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 15,
        children: [
          Row(
            spacing: 16,
            children: [
              SearchBarCustom(),
              ProfileCard(),
            ],
          ),
          //CurrentTurnWidget(),
        ],
      ),
    );

  }

}