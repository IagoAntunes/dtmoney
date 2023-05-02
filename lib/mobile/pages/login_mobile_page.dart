import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmoney/core/models/account_model.dart';
import 'package:dtmoney/mobile/services/login_mobile_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';

import '../../core/colors/app_colors.dart';

class LoginMobilePage extends StatefulWidget {
  LoginMobilePage({super.key});

  @override
  State<LoginMobilePage> createState() => _LoginMobilePageState();
}

class _LoginMobilePageState extends State<LoginMobilePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();

  bool isSignIn = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgDark,
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: isSignIn ? size.height * 0.55 : size.height * 0.60,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: AppColors.backgMed,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Lottie.asset(
                      "assets/lottie/bank_icon.json",
                      height: 100,
                      alignment: Alignment.center,
                    ),
                    const Text(
                      "Bem vindo ao DtMoney!",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
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
                        controller: emailController,
                        style: const TextStyle(
                          color: AppColors.greyText,
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Este campo não pode estar vazio!';
                        //   }
                        //   return null;
                        // },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text("Email"),
                          labelStyle: TextStyle(color: AppColors.greyMedText),
                          hintStyle: TextStyle(
                            color: AppColors.greyMedText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                        controller: senhaController,
                        style: const TextStyle(
                          color: AppColors.greyText,
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return '';
                        //   }
                        //   return null;
                        // },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text("Senha"),
                          labelStyle: TextStyle(color: AppColors.greyMedText),
                          hintStyle: TextStyle(
                            color: AppColors.greyMedText,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !isSignIn,
                      child: Column(
                        children: [
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
                              controller: nomeController,
                              style: const TextStyle(
                                color: AppColors.greyText,
                              ),
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return '';
                              //   }
                              //   return null;
                              // },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                label: Text("Nome"),
                                labelStyle:
                                    TextStyle(color: AppColors.greyMedText),
                                hintStyle: TextStyle(
                                  color: AppColors.greyMedText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isSignIn,
                      child: TextButton(
                        onPressed: () {
                          String email = emailController.text;
                          showDialog(
                            context: context,
                            builder: (context) {
                              TextEditingController redefinicaoSenhaController =
                                  TextEditingController(text: email);
                              return AlertDialog(
                                backgroundColor: AppColors.backgMed,
                                title: const Text(
                                  "Redefinir Senha",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                content: TextFormField(
                                  controller: redefinicaoSenhaController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    label: Text(
                                      "Confirme o E-mail",
                                      style: TextStyle(
                                        color: AppColors.greyMedText,
                                      ),
                                    ),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Cancelar",
                                      style: TextStyle(
                                          color: AppColors.greyMedText),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: AppColors.backgDark),
                                    onPressed: () {
                                      LoginMobileService()
                                          .recuperarSenha(
                                              redefinicaoSenhaController.text)
                                          .then((value) {
                                        if (value == null) {}
                                      });
                                      LoginMobileService()
                                          .recuperarSenha(
                                              redefinicaoSenhaController.text)
                                          .then((String? erro) {
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: const Text(
                                      "Redefinir",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Esqueci minha senha",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.greyText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () async {
                          if (isSignIn) {
                            _logarConta();
                          } else {
                            _cadastrarConta();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            isSignIn ? "Login" : "Cadastrar",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isSignIn = !isSignIn;
                        });
                      },
                      child: Text(
                        isSignIn
                            ? "Ainda não tem conta ?\nClioque aqui para cadastrar"
                            : "Ja possui conta ? \n Clique aqui",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.greyMedText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _cadastrarConta() {
    if (emailController.text.isNotEmpty && senhaController.text.isNotEmpty) {
      LoginMobileService()
          .criarConta(
              emailController.text, senhaController.text, nomeController.text)
          .then(
        (value) async {
          if (value != null) {
            FirebaseFirestore firestore = FirebaseFirestore.instance;
            AccountModel account = AccountModel(
              id: value.user!.uid,
              totalEntries: 0,
              totalOutputs: 0,
              totalgross: 0,
              listTransactions: [],
            );
            await firestore
                .collection('accounts')
                .doc(value.user!.uid)
                .set(account.toMap());
          } else {}
        },
      );
    }
  }

  _logarConta() async {
    if (emailController.text.isNotEmpty && senhaController.text.isNotEmpty) {
      try {
        await LoginMobileService()
            .logarConta(emailController.text, senhaController.text);
      } on FirebaseAuth catch (e) {
        print(e);
      }
    }
  }
}
