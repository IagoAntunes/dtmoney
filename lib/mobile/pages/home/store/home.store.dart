import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../services/login_mobile_service.dart';

part 'home.store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store, ChangeNotifier {
  @action
  Future<String?> deslogar() async {
    try {
      await LoginMobileService().deslogar();
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }
}
