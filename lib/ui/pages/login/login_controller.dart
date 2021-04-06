import 'package:convite/domain/usecases/get_logged.dart';
import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier {
  final GetLoggedUserImpl getLoggedUserImpl;

  LoginController({this.getLoggedUserImpl});

  Future<bool> isLogged() async {
    final user = await getLoggedUserImpl.call();
    if (user != null) {
      print("logado");
      return true;
    } else {
      print("não logado");
      return false;
    }
  }
}
