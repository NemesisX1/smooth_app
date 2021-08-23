import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth/helpers/constants.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    Key? key,
    this.cityName,
    this.amount,
  }) : super(key: key);

  final String? cityName;
  final int? amount;

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.17,
        width: MediaQuery.of(context).size.width * (0.38),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(kGlobalMargin),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.vertical,
          children: [
            Text(
              cityName!,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 15,
              ),
            ),
            Gap(10),
            Text(
              "XOF",
              style: TextStyle(
                color: kGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
            AutoSizeText(
              amount.toString(),
              maxFontSize: 30,
              maxLines: 1,
              style: TextStyle(
                color: kGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(10),
            /*RichText(
          text: TextSpan(
            text: "88",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: " Billbao",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        )*/
          ],
        ),
      );
}
