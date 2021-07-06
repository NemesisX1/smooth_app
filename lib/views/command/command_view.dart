import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth/helpers/constants.dart';
import 'package:smooth/views/widgets/custom_text_button.dart';
import 'package:smooth/views/widgets/custom_text_field.dart';
import '../../viewmodels/command_viewmodel.dart';
import '../../views/base_view.dart';

class CommandView extends StatefulWidget {
  CommandView({Key? key}) : super(key: key);

  @override
  _CommandViewState createState() => _CommandViewState();
}

class _CommandViewState extends State<CommandView> {
  @override
  Widget build(BuildContext context) => BaseView<CommandViewModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              "Smooth Bénin",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * (0.3),
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: kGlobalMargin,
                    vertical: 25,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(kGlobalBorderRadius),
                    ),
                    padding: EdgeInsets.all(kGlobalMargin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Olafemi Adjinda | ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                            children: [
                              TextSpan(
                                text: "Cotonou",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "XOF",
                              style: TextStyle(
                                color: kGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "220 000",
                              style: TextStyle(
                                color: kGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                        Gap(10),
                        RichText(
                          text: TextSpan(
                            text: "1 ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: "Saveurs à préciser*",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: kGlobalMargin),
                  child: Wrap(
                    runSpacing: 7,
                    children: [
                      Form(
                        child: Column(
                          children: [
                            CustomTextField(
                              hintText: "Nom du client",
                              onSaved: (value) {},
                              validator: (value) {},
                            ),
                            CustomTextField(
                              hintText: "Numéro de téléphone",
                              keyboardType: TextInputType.number,
                              onSaved: (value) {},
                              validator: (value) {},
                            ),
                            CustomTextField(
                              hintText: "Saveur",
                              keyboardType: TextInputType.number,
                              onSaved: (value) {},
                              validator: (value) {},
                            ),
                            CustomTextField(
                              hintText: "Quantité",
                              keyboardType: TextInputType.number,
                              onSaved: (value) {},
                              validator: (value) {},
                            ),
                            CustomTextField(
                              hintText: "Ville de livraison",
                              keyboardType: TextInputType.number,
                              onSaved: (value) {},
                              validator: (value) {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: Theme.of(context)
                              .elevatedButtonTheme
                              .style!
                              .copyWith(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.grey)),
                          onPressed: () {},
                          child: Text(
                            "Valider la commande".toUpperCase(),
                          ),
                        ),
                      ),
                      Gap(60),
                      CustomTextButton(
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/addclient'),
                        text: "Ajouter un client",
                      ),
                      Gap(60),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
