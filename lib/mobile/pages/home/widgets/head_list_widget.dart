import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/models/account_model.dart';

class HeadList extends StatelessWidget {
  const HeadList({
    super.key,
    required this.account,
  });

  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Transações',
          style: TextStyle(
            color: AppColors.greyText,
            fontSize: 17,
          ),
        ),
        Text(
          '${account.listTransactions.length} itens',
          style: const TextStyle(
            color: AppColors.greyMedText,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
