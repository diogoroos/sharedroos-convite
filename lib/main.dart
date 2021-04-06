import 'package:convite/domain/usecases/get_logged.dart';
import 'package:convite/infra/datasources/login_datasource.dart';
import 'package:convite/ui/pages/login/cadastro.dart';
import 'package:convite/ui/pages/login/form.dart';
import 'package:convite/ui/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => GetLoggedUserImpl,
        child: Builder(builder: (newBuilder) {
          return MaterialApp(
              title: 'SharedRoos-Convite',
              theme: ThemeData(
                primarySwatch: Colors.green,
              ),
              home: LoginScreen.init(newBuilder));
        }));
  }
}
