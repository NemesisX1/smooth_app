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
        width: MediaQuery.of(context).size.width * (0.38),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(kGlobalMargin),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cityName!,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 17,
              ),
            ),
            Gap(5),
            Text(
              "XOF",
              style: TextStyle(
                color: kGreen,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Gap(3),
            AutoSizeText(
              amount.toString(),
              minFontSize: 20,
              maxFontSize: 100,
              maxLines: 1,
              style: TextStyle(
                color: kGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(10),
            RichText(
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
            ),
          ],
        ),
      );
}
