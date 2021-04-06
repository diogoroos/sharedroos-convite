import 'package:convite/domain/commom/usecase.dart';
import 'package:convite/domain/entities/usuario.dart';
import 'package:convite/domain/repositories/login_repository.dart';

class GetLoggedUserImpl implements UseCase<Usuario, NoParams> {
  final ALoginRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<Usuario> call() async {
    return await repository.loggedUser();
  }
}
