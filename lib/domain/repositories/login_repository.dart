import 'package:convite/domain/entities/usuario.dart';

abstract class ALoginRepository {
  Future<Usuario> authNormalEmail({String email, String password});

  Future<Usuario> loggedUser();

  Future<Usuario> logout();
}
