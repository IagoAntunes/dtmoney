import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';

class InputFilter extends StatelessWidget {
  const InputFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
              color: AppColors.backgDark,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: const TextField(
              style: TextStyle(color: AppColors.greyText),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Busque uma transação',
                hintStyle: TextStyle(
                  color: AppColors.greyMedText,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10),
              side: const BorderSide(
                width: 1,
                color: AppColors.greenApp,
              ),
            ),
            child: const Icon(
              Icons.search_outlined,
              color: AppColors.greenApp,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
