import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../helpers/constants.dart';

class FlavourSummaryCard extends StatelessWidget {
  const FlavourSummaryCard({
    Key? key,
    this.imgUrl,
    this.nbrSold,
    this.title,
    this.totalPrice,
  }) : super(key: key);
  final String? imgUrl;
  final String? title;
  final int? nbrSold;
  final int? totalPrice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kGlobalBorderRadius),
        ),
        padding: EdgeInsets.all(7),
        margin: EdgeInsets.all(kGlobalMargin),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(kGlobalBorderRadius),
              ),
            ),
            Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.title!,
                  style: TextStyle(
                    color: kBrown,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${this.nbrSold} commandes",
                  style: TextStyle(
                    color: kBrown,
                  ),
                ),
                Gap(10),
                Text(
                  "${this.totalPrice} XOF",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
