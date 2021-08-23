import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth/helpers/constants.dart';
import 'package:smooth/views/widgets/custom_text_button.widget.dart';
import 'package:smooth/views/widgets/custom_text_field.widget.dart';
import '../../viewmodels/addclient.viewmodel.dart';
import '../base.view.dart';

class AddClientView extends StatefulWidget {
  static const String routeName = '/addclient';

  AddClientView({Key? key}) : super(key: key);

  @override
  _AddClientViewState createState() => _AddClientViewState();
}

class _AddClientViewState extends State<AddClientView> {
  @override
  Widget build(BuildContext context) => BaseView<AddClientViewModel>(
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
                Gap(20),
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
                      DatePickerDialog(
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950, 1, 1),
                        lastDate: DateTime.now(),
                      ),
                    ],
                  ),
                ),
                Gap(20),
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
                Gap(20),
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
