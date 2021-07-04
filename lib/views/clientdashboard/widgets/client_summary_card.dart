import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth/helpers/constants.dart';

class ClientSummaryCard extends StatelessWidget {
  const ClientSummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Olafemi Adjinda",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Gap(3),
                      Text(
                        "25 fev 2015",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "XOF 30000",
                    style: TextStyle(
                      color: kBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              )
            ],
          ),
          Gap(8),
          Row(
            children: [
              for (int i = 0; i < 5; i++)
                Padding(
                  padding: i > 0
                      ? const EdgeInsets.only(left: 5)
                      : EdgeInsets.all(0),
                  child: RichText(
                    text: TextSpan(
                      text: "10 ",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: "Bao",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
