import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth/helpers/constants.dart';
import 'package:smooth/helpers/enums.dart';
import 'package:smooth/locator.dart';
import 'package:smooth/models/client.model.dart';
import 'package:smooth/models/command.model.dart';
import 'package:smooth/models/flavour.model.dart';
import 'package:smooth/views/command/widgets/field_chooser.widget.dart';
import 'package:smooth/views/widgets/custom_text_button.widget.dart';
import 'package:smooth/views/widgets/custom_text_field.widget.dart';
import 'package:supercharged/supercharged.dart';
import '../../viewmodels/command.viewmodel.dart';
import '../base.view.dart';

class CommandView extends StatefulWidget {
  static const String routeName = '/command';

  CommandView({Key? key}) : super(key: key);

  @override
  _CommandViewState createState() => _CommandViewState();
}

class _CommandViewState extends State<CommandView> {
  Command _command = Command();
  bool didClientExist = false;
  TextEditingController _numberController = TextEditingController();

  static const List<String> fakeClientList = [
    "Donald Auer",
    "Orrin Okuneva",
    "Coralie Schulist",
    "Mrs. Tierra Lueilwitz",
    "Noemy Gibson",
    "Reuben Swaniawski",
    "Rahul Douglas",
    "Joany Bradtke",
    "Lucile Renner",
    "Chyna Miller",
    "Tanya Rolfson",
    "Dr. Percy Gerlach",
    "Ms. Lester Collins",
    "Mrs. Rylee Steuber",
    "Eric Kreiger",
  ]; // for tests purpose

  static const List<String> fakeCityList = [
    "Cotonou",
    "Porto-Novo",
    "Calavi",
    "Parakou",
  ]; // for tests purpose

  static List<Flavour> fakeFlavourList = [
    Flavour(name: "Bilbao", price: 1500),
    Flavour(name: "Fraise", price: 1400),
    Flavour(name: "Lavande", price: 4700),
    Flavour(name: "Vanille", price: 3500),
  ];

  List<Client> remoteClientList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(locator<CommandViewModel>().state);
    locator<CommandViewModel>()
        .getClientList()
        .then((value) => remoteClientList = value);
    locator<CommandViewModel>().setState(ViewState.Idle);
  }

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
                            text: "${model.currentCommand.clientName} | ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                            children: [
                              TextSpan(
                                text: "${model.currentCommand.location}",
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
                              (model.currentCommand.amount *
                                      model.currentCommand.qty)
                                  .toString(),
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
                            text:
                                // ignore: lines_longer_than_80_chars
                                "${model.currentCommand.flavourName} (${model.currentCommand.qty})",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: " saveurs à préciser*",
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
                            FieldChooserWidget(
                              hintText: "Nom du client",
                              fieldList: List<String>.generate(
                                remoteClientList.length,
                                (index) => remoteClientList[index].name!,
                              ),
                              onEdited: (value) {
                                _command.clientName = value;
                                if (List<String?>.generate(
                                        remoteClientList.length,
                                        (index) => remoteClientList[index].name)
                                    .contains(_command.clientName)) {
                                  _numberController.text = remoteClientList
                                      .where((element) =>
                                          element.name == _command.clientName)
                                      .first
                                      .phoneNumber!;

                                  didClientExist = true;
                                } else {
                                  didClientExist = false;
                                }
                                model.updateCurrentCommand(_command);
                              },
                            ),
                            /*CustomTextField(
                                    hintText: "Numéro de téléphone",
                                    controller: _numberController,
                                    validator: (value) {},
                                    keyboardType: TextInputType.number,
                                  ),*/
                            FieldChooserWidget(
                              hintText: "Saveur",
                              fieldList: List<String>.generate(
                                  fakeFlavourList.length,
                                  (index) => fakeFlavourList[index].name!),
                              keyboardType: TextInputType.text,
                              onEdited: (value) {
                                _command.flavourName = value;
                                try {
                                  _command.amount = fakeFlavourList
                                      .where((element) =>
                                          element.name == _command.flavourName)
                                      .first
                                      .price as int;
                                } catch (e) {}
                                model.updateCurrentCommand(_command);
                              },
                            ),
                            FieldChooserWidget(
                              displaySearch: false,
                              hintText: "Quantité",
                              fieldList: fakeClientList,
                              keyboardType: TextInputType.number,
                              onEdited: (value) {
                                _command.qty = value.toInt()!;
                                model.updateCurrentCommand(_command);
                              },
                            ),
                            FieldChooserWidget(
                              hintText: "Ville de livraison",
                              fieldList: appCities,
                              keyboardType: TextInputType.text,
                              onEdited: (value) {
                                _command.location = value;
                                model.updateCurrentCommand(_command);
                              },
                            ),
                          ],
                        ),
                      ),
                      //if (model.didClientExist)
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: didClientExist
                              ? Theme.of(context).elevatedButtonTheme.style
                              : Theme.of(context)
                                  .elevatedButtonTheme
                                  .style!
                                  .copyWith(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Colors.grey,
                                    ),
                                  ),
                          onPressed: didClientExist
                              ? () {
                                  model.validateCommand(callback: () {
                                    Navigator.of(context).pop();
                                  });
                                }
                              : () {},
                          child: model.state == ViewState.Busy
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
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
