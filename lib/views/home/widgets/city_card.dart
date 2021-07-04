import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth/helpers/constants.dart';

class CityCard extends StatelessWidget {
  const CityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
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
              "Cotonou",
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
            Text(
              "220 000",
              style: TextStyle(
                color: kGreen,
                fontWeight: FontWeight.bold,
                fontSize: 30,
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
            )
          ],
        ),
      ),
    );
  }
}
