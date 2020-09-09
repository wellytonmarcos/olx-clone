import 'package:mobx/mobx.dart';
import 'package:olx_mobx/helpers/extensions.dart';
part 'SignUpStore.g.dart';

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  @observable
  String name;
  @observable
  String email;
  @observable
  String phone;
  @observable
  String password;
  @observable
  String confirmPassword;
  @observable
  bool loading = false;

  @action
  void setName(String value) => name = value;
  @action
  void setEmail(String value) => email = value;
  @action
  void setPhone(String value) => phone = value;
  @action
  void setPassword(String value2) => password = value2;
  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @computed
  String get nameError {
    if (name == null || name.length > 6) {
      return null;
    } else if (name != null && name.isEmpty) {
      return 'Campo Obrigatório!';
    } else {
      return 'Nome muito curto!';
    }
  }

  @computed
  String get emailError {
    if (email == null || email.isEmailValid()) {
      return null;
    } else if (email != null && email.isEmpty) {
      return 'Campo Obrigatório!';
    } else {
      return 'E-mail inválido!';
    }
  }

  @computed
  String get phoneError {
    if (phone == null || phoneValid) {
      return null;
    } else if (phone != null && phone.isEmpty) {
      return 'Campo Obrigatório!';
    } else {
      return 'Telefone inválido!';
    }
  }

  @computed
  String get passwordError {
    if (password == null || passwordValid) {
      return null;
    } else if (password != null && password.isEmpty) {
      return 'Campo Obrigatório!';
    } else {
      return 'Senha muito curta!';
    }
  }

  @computed
  String get confirmPasswordError {
    if (confirmPassword == null || confirmPasswordValid) {
      return null;
    } else if (confirmPassword != null && confirmPassword.isEmpty) {
      return 'Campo Obrigatório!';
    } else {
      return 'Senhas não coincidem!';
    }
  }

  @computed
  bool get nameValid {
    if (name != null && name.length > 6) {
      return true;
    } else {
      return false;
    }
  }

  @computed
  bool get emailValid {
    if (email != null && email.isEmailValid()) {
      return true;
    } else {
      return false;
    }
  }

  @computed
  bool get phoneValid {
    if (phone != null && phone.length >= 14) {
      return true;
    } else {
      return false;
    }
  }

  @computed
  bool get passwordValid {
    if (password != null && password.length >= 6) {
      return true;
    } else {
      return false;
    }
  }

  @computed
  bool get confirmPasswordValid {
    if (confirmPassword != null && confirmPassword == password) {
      return true;
    } else {
      return false;
    }
  }

  @computed
  bool get isFormValid =>
      nameValid &&
      emailValid &&
      phoneValid &&
      passwordValid &&
      confirmPasswordValid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @action
  Future<void> _signUp() async {
    loading = true;
    print(loading);
    await Future.delayed(Duration(seconds: 5));
    loading = false;
    print(loading);
  }
}
