import 'package:flutter/material.dart';
import 'package:smooth/helpers/constants.dart';
import 'package:smooth/viewmodels/login.viewmodel.dart';
import 'package:smooth/views/base.view.dart';
import 'package:smooth/views/widgets/custom_text_field.view.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  static const String routeName = '/';

  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) => BaseView<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 25,
                right: 25,
                top: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(100),
                  Text(
                    "Connexion",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * (0.04),
                    ),
                  ),
                  Gap(60),
                  Form(
                    key: _formKey,
                    child: Wrap(
                      runSpacing: MediaQuery.of(context).size.height * (0.035),
                      children: [
                        CustomTextField(
                          controller: _usernameController,
                          hintText: "Nom d'utilisateur",
                          onSaved: (value) {},
                          validator: model.usernameValidator,
                        ),
                        CustomTextField(
                          controller: _pwdController,
                          hintText: "Mot de passe",
                          onSaved: (value) {},
                          validator: model.pwdValidator,
                        )
                      ],
                    ),
                  ),
                  Gap(50),
                  Container(
                    width: double.infinity,
                    height: kGlobalButtonHeigth,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                              '/tabhome', (route) => false),
                      child: Text(
                        "SE CONNECTER",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
