import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth/views/widgets/custom_text_field.dart';
import 'package:smooth/helpers/extensions.dart';

class FieldChooserWidget extends StatefulWidget {
  FieldChooserWidget({Key? key}) : super(key: key);

  @override
  _FieldChooserWidgetState createState() => _FieldChooserWidgetState();
}

class _FieldChooserWidgetState extends State<FieldChooserWidget> {
  final List<String> fakeClientList = [
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
  ];
  String _typedField = "";
  bool _hasFoundName = true;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          CustomTextField(
            hintText: "Nom du client",
            onChanged: (value) {
              setState(() {
                _typedField = value;
                _hasFoundName = true;
              });
            },
            onSaved: (value) {
              print("love");
            },
            validator: (value) {},
          ),
          _typedField.isNotEmpty && _hasFoundName
              ? Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Theme.of(context).accentColor.withOpacity(0.15),
                      ),
                      margin: EdgeInsets.only(top: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Color(0xff733904),
                            size: 26,
                          ),
                          Gap(10),
                          Text(
                            "Ecrire le nom du client",
                            style: TextStyle(
                              color: Color(0xff733904),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...List<Widget>.generate(fakeClientList.length, (index) {
                      if (fakeClientList[index]
                          .toLowerCase()
                          .contains(_typedField.toLowerCase())) {
                        return fakeClientList[index].toListTile(
                          color: Color(0xffCF8F5),
                          onTap: () {
                            setState(() {
                              _typedField = fakeClientList[index];
                            });
                          },
                        );
                      } else {
                        setState(() {
                          _hasFoundName = false;
                        });
                      }
                      return Container();
                    }),
                  ],
                )
              : Container(),
        ],
      );
}
