import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmoney/core/colors/app_colors.dart';
import 'package:dtmoney/core/models/account_model.dart';
import 'package:dtmoney/mobile/pages/home/widgets/dialog_new_transaction_widget.dart';
import 'package:dtmoney/mobile/services/login_mobile_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeMobilePage extends StatefulWidget {
  const HomeMobilePage({super.key});

  @override
  State<HomeMobilePage> createState() => _HomeMobilePageState();
}

class _HomeMobilePageState extends State<HomeMobilePage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  late AccountModel account;
  late StreamSubscription listener;

  @override
  void initState() {
    super.initState();
    addListener();
  }

  addListener() {
    listener = firestore.collection('accounts').snapshots().listen((event) {
      getAll();
    });
  }

  getAll() async {
    print('teste');
    await firestore
        .collection('accounts')
        .doc(auth.currentUser!.uid)
        .get()
        .then((value) {
      if (value.data() != null) {
        account = AccountModel.fromMap(value.data()!);
      }
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     var firestore = FirebaseFirestore.instance;
      //     await firestore
      //         .collection('teste')
      //         .doc('1223')
      //         .set({"joao": "pedro"});
      //   },
      // ),
      backgroundColor: AppColors.backgDark,
      body: SafeArea(
        child: FutureBuilder(
          future: getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      deslogar();
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
                                    builder: (context) =>
                                        DialogNewTransaction(size: size),
                                  );
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
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: AppColors.backgMed,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 100, left: 20, right: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: const BoxDecoration(
                                          color: AppColors.backgDark,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        child: const TextField(
                                          style: TextStyle(
                                              color: AppColors.greyText),
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
                                    SizedBox(
                                      child: OutlinedButton(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
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
                                ),
                                const SizedBox(height: 20),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: account.listTransactions.length,
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
                                          const Positioned(
                                            right: 0,
                                            child: Icon(
                                              Icons.arrow_circle_up_outlined,
                                              size: 40,
                                              color: AppColors.greenApp,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Entradas',
                                                style: TextStyle(
                                                  color: AppColors.greyText,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "R\$ 17.400,00",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Expanded(child: SizedBox()),
                                              Text(
                                                "Ultima entrada em 13 de abril",
                                                style: TextStyle(
                                                  color: AppColors.greyMedText,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    top: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        const Text(
                                          "Ultima entrada em 13 de abril",
                                          style: TextStyle(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        const Text(
                                          "Ultima entrada em 13 de abril",
                                          style: TextStyle(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        const Text(
                                          "Ultima entrada em 13 de abril",
                                          style: TextStyle(
                                            color: Colors.white,
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<String?> deslogar() async {
    try {
      await LoginMobileService().deslogar();
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }
}
