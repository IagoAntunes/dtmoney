import 'package:firebase_auth/firebase_auth.dart';

class LoginMobileService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String?> logarConta(String email, String senha) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }

  Future<String?> recuperarSenha(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    return null;
  }

  Future<String?> criarConta(String email, String senha, String nome) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: senha);
      userCredential.user!.updateDisplayName(nome);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }

  Future<String?> deslogar() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }
}
