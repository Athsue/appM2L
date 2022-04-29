import 'package:flutter/material.dart';
import 'package:flutterapp/livre.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: ProgressHUD(
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage('assets/m2l2.jpg'),
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "M2L",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white),
                    )),
              ],
            ),
            const Padding(
                padding: EdgeInsets.only(left: 20, top: 90, bottom: 30),
                child: Center(
                    child: Text(
                  "Se connecter",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white),
                ))),
            FormHelper.inputFieldWidget(context, "Email", "Adresse E-Mail",
                (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "L'adresse E-Mail ne peut être vide";
              }
              return null;
            }, (onSaved) {
              email = onSaved;
            },
                borderFocusColor: Colors.white,
                backgroundColor: Colors.red,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.8),
                validationColor: Colors.black,
                borderRadius: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "Mot_de_passe",
                "Mot de passe",
                (onValidateVal) {
                  if (onValidateVal.isEmpty) {
                    return "Le mot de passe ne peut être vide";
                  }
                  return null;
                },
                (onSaved) {
                  password = onSaved;
                },
                borderFocusColor: Colors.white,
                backgroundColor: Colors.red,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.8),
                validationColor: Colors.black,
                borderRadius: 10,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: FormHelper.submitButton("Connexion", () {
                dynamic validate = globalFormKey.currentState?.validate();
                if (validate != null && validate) {
                  globalFormKey.currentState?.save();
                  Livre.Login(context, email, password);
                }
              },
                  btnColor: Colors.red,
                  borderColor: Colors.white,
                  txtColor: Colors.white,
                  borderRadius: 10),
            )
          ]),
    );
  }
}
