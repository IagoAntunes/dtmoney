import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmoney/core/colors/app_colors.dart';
import 'package:dtmoney/core/models/account_model.dart';
import 'package:dtmoney/mobile/pages/home/store/home.store.dart';
import 'package:dtmoney/mobile/pages/home/widgets/head_list_widget.dart';
import 'package:dtmoney/mobile/pages/home/widgets/head_widget.dart';
import 'package:dtmoney/mobile/pages/home/widgets/input_filter_widget.dart';
import 'package:dtmoney/mobile/pages/home/widgets/list_transactions_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/menu_view_values_widget.dart';

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
    listener = firestore
        .collection('accounts')
        .doc(auth.currentUser!.uid)
        .snapshots()
        .listen((event) {
      getAll();
    });
  }

  getAll() async {
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

  HomeStore store = HomeStore();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                      Head(size: size, store: store),
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
                                HeadList(account: account),
                                const SizedBox(height: 20),
                                const InputFilter(),
                                const SizedBox(height: 20),
                                ListTransactions(account: account, size: size)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  MenuViewValues(size: size, account: account),
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
}
