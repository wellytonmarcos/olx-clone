import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/components/ErrorBox.dart';
import 'package:olx_mobx/screens/signup/components/FieldTitle.dart';
import 'package:olx_mobx/stores/SignUpStore.dart';

class SingUpScreen extends StatelessWidget {
  final SignUpStore signUpStore = SignUpStore();

  double spaceSizedBox = 12;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 20),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(
                      builder: (_) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ErrorBox(
                            message: signUpStore.error,
                          ),
                        );
                      },
                    ),
                    FieldTitle(
                      title: 'Apelido',
                      subtitle: 'Como aparecerá em seus anúncios',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Ex: João S',
                          errorText: signUpStore.nameError,
                        ),
                        onChanged: signUpStore.setName,
                      );
                    }),
                    SizedBox(
                      height: spaceSizedBox,
                    ),
                    FieldTitle(
                      title: 'E-mail',
                      subtitle: 'Enviaremos um e-mail de confirmação',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Ex: joao@gmail.com',
                          errorText: signUpStore.emailError,
                        ),
                        onChanged: signUpStore.setEmail,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                      );
                    }),
                    SizedBox(
                      height: spaceSizedBox,
                    ),
                    FieldTitle(
                      title: 'Celular',
                      subtitle: 'Proteja sua conta',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          hintText: 'Ex: (35) 99999-9999',
                          errorText: signUpStore.phoneError,
                        ),
                        onChanged: signUpStore.setPhone,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                      );
                    }),
                    SizedBox(
                      height: spaceSizedBox,
                    ),
                    FieldTitle(
                      title: 'Senha',
                      subtitle: 'Digite sua senha',
                    ),
                    Observer(
                      builder: (_) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            isDense: true,
                            errorText: signUpStore.passwordError,
                          ),
                          obscureText: true,
                          onChanged: signUpStore.setPassword,
                        );
                      },
                    ),
                    SizedBox(
                      height: spaceSizedBox,
                    ),
                    FieldTitle(
                      title: 'Confirmar Senha',
                      subtitle: 'Repita sua senha.',
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        enabled: !signUpStore.loading,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: signUpStore.confirmPasswordError,
                        ),
                        obscureText: true,
                        onChanged: signUpStore.setConfirmPassword,
                      );
                    }),
                    SizedBox(
                      height: spaceSizedBox,
                    ),
                    Observer(builder: (_) {
                      return Container(
                        height: 42,
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        child: RaisedButton(
                          color: Colors.orange,
                          disabledColor: Colors.orange.withAlpha(120),
                          child: signUpStore.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text(
                                  'CADASTRAR',
                                  style: TextStyle(fontSize: 18),
                                ),
                          textColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: signUpStore.signUpPressed,
                        ),
                      );
                    }),
                    Divider(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 3, bottom: 4, top: 8),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          Text('Já tem uma conta? ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w400)),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Entrar',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w700)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
