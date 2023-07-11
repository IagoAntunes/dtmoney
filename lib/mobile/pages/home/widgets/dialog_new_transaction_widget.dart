import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmoney/core/models/transaction_model.dart';
import 'package:dtmoney/mobile/pages/home/store/dialog.store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/colors/app_colors.dart';

class DialogNewTransaction extends StatelessWidget {
  DialogNewTransaction({
    super.key,
    required this.size,
  });
  final Size size;
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = DialogStore();
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              margin: const EdgeInsets.all(12),
              width: size.width * 0.8,
              height: size.height * 0.55,
              decoration: BoxDecoration(
                  color: AppColors.backgMed,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nova Transação',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      decoration: const BoxDecoration(
                        color: AppColors.backgDark,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: TextFormField(
                        controller: descriptionController,
                        style: const TextStyle(
                          color: AppColors.greyText,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text("Descrição"),
                          labelStyle: TextStyle(color: AppColors.greyMedText),
                          hintStyle: TextStyle(
                            color: AppColors.greyMedText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      decoration: const BoxDecoration(
                        color: AppColors.backgDark,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: TextFormField(
                        controller: priceController,
                        style: const TextStyle(
                          color: AppColors.greyText,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text("Preço"),
                          labelStyle: TextStyle(color: AppColors.greyMedText),
                          hintStyle: TextStyle(
                            color: AppColors.greyMedText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      decoration: const BoxDecoration(
                        color: AppColors.backgDark,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: TextFormField(
                        controller: categoryController,
                        style: const TextStyle(
                          color: AppColors.greyText,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text("Categoria"),
                          labelStyle: TextStyle(color: AppColors.greyMedText),
                          hintStyle: TextStyle(
                            color: AppColors.greyMedText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              store.setTypeTransaction(true);
                            },
                            child: Observer(builder: (context) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: store.typeTransaction == null
                                      ? AppColors.greyMed
                                      : (store.typeTransaction!
                                          ? AppColors.backgDark
                                          : AppColors.greyMed),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  border: Border.all(
                                    width: 3,
                                    color: AppColors.greenDarkApp,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.arrow_circle_up_outlined,
                                      color: AppColors.greenApp,
                                      size: 30,
                                    ),
                                    Text(
                                      "Entrada",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.greyText,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              store.setTypeTransaction(false);
                            },
                            child: Observer(builder: (context) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: store.typeTransaction == null
                                      ? AppColors.greyMed
                                      : (!store.typeTransaction!
                                          ? AppColors.backgDark
                                          : AppColors.greyMed),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  border: Border.all(
                                    width: 2,
                                    color: AppColors.redApp,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.arrow_circle_down_outlined,
                                      color: AppColors.redApp,
                                      size: 30,
                                    ),
                                    Text(
                                      "Saida",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.greyText,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (descriptionController.text.isNotEmpty &&
                              priceController.text.isNotEmpty &&
                              categoryController.text.isNotEmpty &&
                              store.typeTransaction != null) {
                            FirebaseFirestore firestore =
                                FirebaseFirestore.instance;
                            FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                            TransactionModel transaction = TransactionModel(
                              description: descriptionController.text,
                              price: double.parse(priceController.text),
                              date: DateTime.now().toString(),
                              category: categoryController.text,
                              isEntrie: store.typeTransaction!,
                            );
                            
                            await firestore
                                .collection('accounts')
                                .doc(firebaseAuth.currentUser!.uid)
                                .update({
                              'listTransactions':
                                  FieldValue.arrayUnion([transaction.toMap()])
                            }).then(
                              (value) => Navigator.pop(context),
                            );
                          }
                        },
                        child: const Text("Transferir"),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
