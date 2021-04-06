import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convite/domain/entities/usuario.dart';
import 'package:convite/infra/models/usuario_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ALoginDataSource {
  Future<UsuarioModel> loginEmail({String email, String password});

  Future<UsuarioModel> createUser({String email, String senha});

  Future<UsuarioModel> currentUser();

  Future<bool> logout();
}

class LoginDataSourceImpl implements ALoginDataSource {
  LoginDataSourceImpl();

  @override
  Future<UsuarioModel> currentUser() async {
    User currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return new UsuarioModel(
          nomeCompleto: null,
          email: null,
          isMaster: null,
          token: null,
          id: null);
    } else {
      return new UsuarioModel(
          nomeCompleto: currentUser.displayName,
          email: FirebaseAuth.instance.currentUser.email,
          isMaster: await isMaster(currentUser.email),
          token: await currentUser.getIdToken(),
          id: currentUser.uid);
    }
  }

  @override
  Future<UsuarioModel> loginEmail({String email, String password}) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        UserCredential login = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        FirebaseAuth.instance.authStateChanges();
        return new UsuarioModel(
            nomeCompleto: login.user.displayName,
            email: login.user.email,
            isMaster: await isMaster(login.user.email),
            token: await login.user.getIdToken(),
            id: login.user.uid);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      } catch (e) {
        print(e);
      }
    }
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() async => FirebaseAuth.instance.signOut().then((value) {
        print("Usuário fez logoff");
        return true;
      });

  Future<bool> isMaster(email) async {
    QuerySnapshot cliente = await FirebaseFirestore.instance
        .collection('masters')
        .where("email", isEqualTo: email)
        .get();

    return cliente.docs.isNotEmpty ? true : false;
  }

  @override
  Future<UsuarioModel> createUser({String email, String senha}) async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );
    return UsuarioModel(
        nomeCompleto: credential.user.displayName,
        email: email,
        isMaster: await isMaster(email),
        token: await credential.user.getIdToken(),
        id: credential.user.uid);
  }
}
