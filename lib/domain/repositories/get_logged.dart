import 'package:convite/domain/entities/usuario.dart';
import 'package:convite/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class AGetLoggedUser {
  Future<Usuario> call();
}
