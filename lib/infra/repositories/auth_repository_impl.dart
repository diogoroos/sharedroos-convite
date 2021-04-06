import 'package:convite/domain/entities/usuario.dart';
import 'package:convite/domain/repositories/login_repository.dart';
import 'package:convite/infra/datasources/login_datasource.dart';

class LoginRepositoryImpl implements ALoginRepository {
  final ALoginDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<Usuario> loggedUser() async {
    return remoteDataSource.currentUser();
  }

  @override
  Future<Usuario> authNormalEmail({String email, String password}) async {
    return remoteDataSource.loginEmail();
  }

  @override
  Future<Usuario> logout() {
    throw UnimplementedError();
  }
}
