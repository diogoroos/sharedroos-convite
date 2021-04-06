import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormLogin extends StatelessWidget {
  final redirecionar;

  const FormLogin({Key key, this.redirecionar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final loginStore = Provider.of<LoginStore>(context);
    //final cadastroUsuarioStore = Provider.of<CadastroUsuarioStore>(context);
    //final appStore = Provider.of<AppStore>(context);

    showAlertDialog(String mensagem, int status) {
      AlertDialog alert = AlertDialog(
        content: Container(
          height: 150,
          width: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (() {
                if (status == 0) {
                  return CircularProgressIndicator();
                } else if (status == 1) {
                  return Icon(Icons.check_circle_outline_outlined,
                      size: 40, color: Colors.green);
                }

                return Icon(Icons.highlight_off_outlined,
                    size: 40, color: Colors.red);
              }()),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(mensagem),
              ),
            ],
          ),
        ),
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }

    return Center(
      child: Column(
        children: [
          Container(
            width:
                size.width > size.height ? size.width * 0.4 : size.width * 0.9,
            child: TextField(
              //onChanged: loginStore.changeEmail,
              autofocus: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                //labelStyle: TextStyle(color: azulPrimarioMedium),
                labelText: "E-mail",
                prefixIcon: Icon(
                  Icons.person,
                  //color: azulPrimarioMedium,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width:
                size.width > size.height ? size.width * 0.4 : size.width * 0.9,
            child: TextField(
              //onChanged: loginStore.changeSenha,
              autofocus: false,
              //obscureText: loginStore.hidePassWord,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                //labelStyle: TextStyle(color: azulPrimarioMedium),
                labelText: "Senha",
                //prefixIcon: Icon(Icons.lock, color: azulPrimarioMedium),
              ),
            ),
          ),
          Container(
            width:
                size.width > size.height ? size.width * 0.4 : size.width * 0.9,
            height: 50,
            margin: EdgeInsets.only(top: 15),
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () async {
                showAlertDialog('Entrando ...', 0);
                //await loginStore.signInWithEmailAndPassword();
                //await appStore.getUsuarioLogado();
                //Navigator.pop(context);

                // if (Singleton.getInstance().usuario.usuarioLoja) {
                //   appStore.selectDestinationLoja(0);
                //   Navigator.pop(context);
                //   main();
                // } else {
                //   appStore.selectDestination(0);
                // }

                // if (redirecionar != null) {
                //   if (redirecionar == 'fechar') {
                //     Navigator.pop(context);
                //   } else {
                //     Navigator.pushReplacement(context,
                //         MaterialPageRoute(builder: (context) => redirecionar));
                //   }
                // }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              padding: EdgeInsets.all(0.0),
              child: Text(
                "ENTRAR",
                textAlign: TextAlign.center,
                //style: TextStyle(color: azulPrimarioMedium, fontSize: 14.0),
              ),
            ),
          ),
          Container(
              height: 50,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      //color: amareloPrimarioLight,
                      ),
                  borderRadius: BorderRadius.circular(5)),
              child: FlatButton(
                child: Text("ESQUECEU SUA SENHA?",
                    style: TextStyle(
                        //color: amareloPrimarioLight,
                        )),
                // onPressed: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => MudarSenhaScreen()),
                //   );
                // },
              )),
          Container(
              height: 50,
              margin: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  //border: Border.all(color: amareloPrimarioLight),
                  borderRadius: BorderRadius.circular(5)),
              child: FlatButton(
                child: Text("CADASTRAR",
                    style: TextStyle(
                        //color: amareloPrimarioLight,
                        )),
                onPressed: () {
                  //cadastroUsuarioStore.limparFormulario();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => CadastroUsuarioScreen()),
                  // );
                },
              )),
        ],
      ),
    );
  }
}
