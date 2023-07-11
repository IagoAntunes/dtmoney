import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/models/account_model.dart';

class MenuViewValues extends StatelessWidget {
  const MenuViewValues({
    super.key,
    required this.size,
    required this.account,
  });

  final Size size;
  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: SizedBox(
          width: size.width,
          height: size.height * 0.22,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            children: [
              LayoutBuilder(builder: (p0, p1) {
                return Container(
                  height: 200,
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
                      const Positioned(
                        right: 0,
                        child: Icon(
                          Icons.arrow_circle_up_outlined,
                          size: 40,
                          color: AppColors.greenApp,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Entradas',
                            style: TextStyle(
                              color: AppColors.greyText,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: p1.maxHeight * 0.15,
                          ),
                          Text(
                            "R\$ ${account.totalEntries}",
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            account.listTransactions
                                    .where(
                                        (element) => element.isEntrie == true)
                                    .isNotEmpty
                                ? "Ultima ${account.listTransactions.where((element) => element.isEntrie == true).toList()[account.listTransactions.where((element) => element.isEntrie == true).length - 1].date.split(' ')[0]}"
                                : '',
                            style: const TextStyle(
                              color: AppColors.greyMedText,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(
                width: size.width * 0.05,
              ),
              LayoutBuilder(builder: (p0, p1) {
                return Container(
                  height: 200,
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
                      const Positioned(
                        right: 0,
                        child: Icon(
                          Icons.arrow_circle_down_outlined,
                          size: 40,
                          color: AppColors.redApp,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Saidas',
                            style: TextStyle(
                              color: AppColors.greyText,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: p1.maxHeight * 0.15,
                          ),
                          Text(
                            "R\$ ${account.totalOutputs}",
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            account.listTransactions
                                    .where(
                                        (element) => element.isEntrie == false)
                                    .isNotEmpty
                                ? "Ultima ${account.listTransactions.where((element) => element.isEntrie == false).toList()[account.listTransactions.where((element) => element.isEntrie == false).length - 1].date.split(' ')[0]}"
                                : '',
                            style: const TextStyle(
                              color: AppColors.greyMedText,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(
                width: size.width * 0.05,
              ),
              LayoutBuilder(builder: (p0, p1) {
                return Container(
                  height: 200,
                  width: size.width * 0.7,
                  padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                    color: AppColors.greenDarkApp,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        right: 0,
                        child: Icon(
                          Icons.attach_money_outlined,
                          size: 40,
                          color: AppColors.greenApp,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              color: AppColors.greyText,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: p1.maxHeight * 0.15,
                          ),
                          Text(
                            "R\$ ${account.totalgross}",
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
