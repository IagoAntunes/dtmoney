import 'package:dtmoney/mobile/pages/home/store/home.store.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';
import 'dialog_new_transaction_widget.dart';

class Head extends StatelessWidget {
  const Head({
    super.key,
    required this.size,
    required this.store,
  });

  final Size size;
  final HomeStore store;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.backgDark,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.person),
                    Text(
                      "DT Money",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    store.deslogar();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => DialogNewTransaction(size: size),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              child: const Text(
                "Nova Transação",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
