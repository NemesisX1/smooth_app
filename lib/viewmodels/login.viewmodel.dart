import 'base.viewmodel.dart';

class LoginViewModel extends BaseViewModel {
  String? usernameValidator(String? value) {
    if (value != "smoothbenin" || value!.isEmpty) {
      return "Ce nom n'est pas valide";
    }
    return null;
  }

  String? pwdValidator(String? value) {
    if (value != "bossdaryl" || value!.isEmpty) {
      return "Ce mot de passe n'est pas valide";
    }
    return null;
  }

  void onSubmitted(String value) {}
}
