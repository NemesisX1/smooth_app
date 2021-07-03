import 'package:flutter/material.dart';
import 'package:smooth/helpers/constants.dart';
import 'package:smooth/views/widgets/custom_text_button.dart';
import 'package:smooth/views/widgets/custom_text_field.dart';
import '../../viewmodels/addclient_viewmodel.dart';
import '../../views/base_view.dart';

class AddClientView extends StatefulWidget {
  AddClientView({Key? key}) : super(key: key);

  @override
  _AddClientViewState createState() => _AddClientViewState();
}

class _AddClientViewState extends State<AddClientView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AddClientViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Smooth Bénin",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 50,
            left: kGlobalMargin,
            right: kGlobalMargin,
            bottom: kGlobalMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nouveau client",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: "Nom du client",
                      onSaved: (value) {},
                      validator: (value) {},
                    ),
                    CustomTextField(
                      hintText: "Prénom",
                      onSaved: (value) {},
                      validator: (value) {},
                    ),
                    CustomTextField(
                      hintText: "Numéro de téléphone",
                      onSaved: (value) {},
                      validator: (value) {},
                    ),
                    CustomTextField(
                      hintText: "Date de naissance",
                      onSaved: (value) {},
                      validator: (value) {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: kGlobalButtonHeigth,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Ajouter".toUpperCase(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextButton(
                text: "Anuller l'ajout",
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
