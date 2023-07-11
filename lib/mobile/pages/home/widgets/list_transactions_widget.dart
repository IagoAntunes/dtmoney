import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/models/account_model.dart';

class ListTransactions extends StatelessWidget {
  const ListTransactions({
    super.key,
    required this.account,
    required this.size,
  });

  final AccountModel account;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: account.listTransactions.length,
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) => Container(
          height: size.height * 0.15,
          width: size.width * 0.7,
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
            color: AppColors.greyMed,
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: Icon(
                  account.listTransactions[index].isEntrie
                      ? Icons.arrow_circle_up_outlined
                      : Icons.arrow_circle_down_outlined,
                  size: 40,
                  color: account.listTransactions[index].isEntrie
                      ? AppColors.greenApp
                      : AppColors.redApp,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    account.listTransactions[index].description,
                    style: const TextStyle(
                      color: AppColors.greyText,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "R\$ ${account.listTransactions[index].price}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.category_outlined,
                            color: AppColors.greyMedText,
                          ),
                          Text(
                            account.listTransactions[index].category,
                            style: const TextStyle(
                              color: AppColors.greyMedText,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: AppColors.greyMedText,
                          ),
                          Text(
                            account.listTransactions[index].date.split(' ')[0],
                            style: const TextStyle(
                              color: AppColors.greyMedText,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
