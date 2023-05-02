import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';

class DialogNewTransaction extends StatelessWidget {
  DialogNewTransaction({
    super.key,
    required this.size,
  });
  bool? isInput;
  final Size size;
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              margin: const EdgeInsets.all(12),
              width: size.width * 0.8,
              height: size.height * 0.45,
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
                          label: Text("ID"),
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
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.greyMed,
                                borderRadius: BorderRadius.all(
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
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.greyMed,
                                borderRadius: BorderRadius.all(
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
                                    size: 25,
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
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (descriptionController.text.isNotEmpty &&
                              priceController.text.isNotEmpty &&
                              categoryController.text.isNotEmpty) {
                            FirebaseFirestore firestore =
                                FirebaseFirestore.instance;
                            FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                            // firestore
                            //     .collection('accounts')
                            //     .doc(firebaseAuth.currentUser!.uuid);
                          }
                        },
                        child: const Text("Cadastrar"),
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
