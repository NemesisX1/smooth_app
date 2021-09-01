import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:smooth/helpers/constants.dart';
import 'package:smooth/models/client.model.dart';
import 'package:smooth/models/command.model.dart';
import 'package:smooth/viewmodels/clientdashboard.viewmodel.dart';

class ClientSummaryCard extends StatelessWidget {
  const ClientSummaryCard({
    Key? key,
    required this.client,
    required this.model,
  }) : super(key: key);

  final Client client;
  final ClientDashboardViewModel model;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          children: [
            StreamBuilder(
              stream: model.getCommandsAsStream(client.name!),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) return ErrorWidget.withDetails();
                if (!snapshot.hasData) {
                  return Container();
                } else {
                  List<Command> commands = List<Command>.generate(
                      snapshot.data.docs.length,
                      (index) =>
                          Command.fromJson(snapshot.data.docs[index].data()));

                  return commands.isNotEmpty
                      ? Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          client.name!,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Gap(3),
                                        Text(
                                          DateFormat('d MMM yyy', 'fr_FR')
                                              .format(client.birthday!),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "XOF ${model.getTotalAmout(commands)}",
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
                                for (int i = 0; i < flavoursList.length; i++)
                                  Padding(
                                    padding: i > 0
                                        ? const EdgeInsets.only(left: 5)
                                        : EdgeInsets.all(0),
                                    child: RichText(
                                      text: TextSpan(
                                        text: model
                                            .getFlavoursQty(
                                                commands, flavoursList[i].name!)
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                ' ${flavoursList[i].shortName} ',
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
                          ],
                        )
                      : Container();
                }
              },
            ),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      );
}
