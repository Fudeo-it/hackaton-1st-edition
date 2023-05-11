import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudeo_hackaton/theme/theme.dart';

class NoFavouritesMessage extends StatelessWidget {
  const NoFavouritesMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: SvgPicture.asset(
              'assets/no_result.svg',
            ),
          ),
          const Text(
            'Non ci sono annunci salvati!',
            style: AppFonts.favouriteNoResults,
          )
        ],
      ),
    );
  }
}
