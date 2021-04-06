import 'package:convite/domain/entities/usuario.dart';
import 'package:meta/meta.dart';

class UsuarioModel extends Usuario {
  UsuarioModel({
    @required String nomeCompleto,
    @required String email,
    @required bool isMaster,
    @required String token,
    @required String id,
  }) : super(
            nomeCompleto: nomeCompleto,
            email: email,
            isMaster: isMaster,
            token: token,
            id: id);

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
      nomeCompleto: json['nomeCompleto'],
      email: json['email'],
      isMaster: json['isMaster'],
      token: json['token'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nomeCompleto': nomeCompleto,
      'email': email,
      'isMaster': isMaster,
      'token': token,
      'id': id,
    };
  }
}
