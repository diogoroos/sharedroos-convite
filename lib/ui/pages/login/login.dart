import 'package:convite/domain/usecases/get_logged.dart';
import 'package:convite/infra/datasources/login_datasource.dart';
import 'package:convite/ui/pages/login/form.dart';
import 'package:convite/ui/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen._();

  //final String redirecionar = "";
  const LoginScreen({Key key}) : super(key: key);

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (a) =>
          LoginController(getLoggedUserImpl: context.read<GetLoggedUserImpl>()),
      builder: (z, y) => LoginScreen._(),
    );
  }

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void validate() async {
    final state = context.read<GetLoggedUserImpl>();
    final result = await state.call();
    if (result.email != null) {
      Navigator.pushNamed(context, '/cadastro');
    } else {
      Navigator.pushNamed(context, '/form');
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((a) {
      validate();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 30),
          children: <Widget>[
            //Padding(padding: const EdgeInsets.only(top: 24.0), child: ImageLogin()),
            Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: FormLogin(redirecionar: "")),
          ],
        ),
      ),
    );
  }
}
