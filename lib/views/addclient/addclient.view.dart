import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth/helpers/constants.dart';
import 'package:smooth/helpers/enums.dart';
import 'package:smooth/models/client.model.dart';
import 'package:smooth/views/widgets/custom_text_button.widget.dart';
import 'package:smooth/views/widgets/custom_text_field.widget.dart';
import '../../viewmodels/addclient.viewmodel.dart';
import '../base.view.dart';
import 'package:intl/intl.dart';

class DateSelectorButton extends StatefulWidget {
  DateSelectorButton({
    Key? key,
    this.minTime,
    this.maxTime,
    this.onDateChosen,
  }) : super(key: key);

  final DateTime? minTime;
  final DateTime? maxTime;
  final dynamic Function(DateTime?)? onDateChosen;

  @override
  _DateSelectorButtonState createState() => _DateSelectorButtonState();
}

class _DateSelectorButtonState extends State<DateSelectorButton> {
  DateTime _missionTime = DateTime.now();
  String? param;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).accentColor),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * (0.5),
              ),
              child: Text(
                DateFormat('d MMM ' 'yyyy', "fr_FR").format(_missionTime),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950, 1, 1),
                  lastDate: DateTime.now(),
                ).then((value) {
                  setState(() {
                    _missionTime = value!;
                  });
                  widget.onDateChosen!(value);
                });
              },
              icon: Icon(
                Icons.date_range,
                color: kBrown,
                size: 30,
              ),
            ),
          ],
        ),
      );
}

class AddClientView extends StatefulWidget {
  static const String routeName = '/addclient';

  AddClientView({Key? key}) : super(key: key);

  @override
  _AddClientViewState createState() => _AddClientViewState();
}

class _AddClientViewState extends State<AddClientView> {
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  late DateTime _birthdayDate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _birthdayDate = DateTime.now();
  }

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
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: "Nom du client",
                        controller: _surnameController,
                        validator: (value) {
                          RegExp regex = RegExp('[a-zA-Z]');

                          if (regex.hasMatch(value!)) return null;
                          return "Nom non valide";
                        },
                      ),
                      CustomTextField(
                        hintText: "Prénom",
                        controller: _firstnameController,
                        validator: (value) {
                          RegExp regex = RegExp(r'[A-Z]', caseSensitive: false);

                          if (regex.hasMatch(value!)) return null;
                          return "Prénom non valide";
                        },
                      ),
                      CustomTextField(
                        hintText: "Numéro de téléphone",
                        controller: _phoneNumberController,
                        validator: (value) {
                          RegExp regex = RegExp("[0-9]");
                          if (!regex.hasMatch(value!) || value.length < 8) {
                            return 'Numéro non valide';
                          }
                          return null;
                        },
                      ),
                      DateSelectorButton(
                        onDateChosen: (value) {
                          _birthdayDate = value!;
                        },
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate() &&
                          _birthdayDate != DateTime.now()) {
                        model.setState(ViewState.Busy);

                        await model.addClient(Client(
                          name:
                              // ignore: lines_longer_than_80_chars
                              '${_surnameController.text} ${_firstnameController.text}',
                          phoneNumber: _phoneNumberController.text,
                          birthday: _birthdayDate,
                        ));

                        model.setState(ViewState.Idle);
                        Navigator.of(context).pop();
                      }
                      //model.setState(ViewState.Idle);
                    },
                    child: model.state == ViewState.Busy
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Ajouter".toUpperCase(),
                          ),
                  ),
                ),
                Gap(20),
                CustomTextButton(
                  text: "Annuler".toUpperCase(),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ),
      );
}
