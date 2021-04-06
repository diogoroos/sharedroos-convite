import 'package:convite/ui/pages/login/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CadastroScreen extends StatelessWidget {
  final redirecionar;

  const CadastroScreen({Key key, this.redirecionar}) : super(key: key);
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
            //Padding(padding: const EdgeInsets.only(top: 20.0), child: ImageLogin()),
            Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: FormLogin(redirecionar: redirecionar)),
          ],
        ),
      ),
    );
  }
}
