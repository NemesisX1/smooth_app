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
            StreamBuilder(
              stream: model.getCommandsAsStream(client.name!),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) return ErrorWidget.withDetails();
                if (!snapshot.hasData) {
                  return CircularProgressIndicator(
                    color: Theme.of(context).accentColor,
                  );
                } else {
                  try {
                    List<Command> listClientCommand = List<Command>.generate(
                        snapshot.data.docs.length, (index) {
                      print(snapshot.data.docs[index].data());
                      return Command.fromJson(snapshot.data.docs[index].data());
                    });

                    print(listClientCommand);

                    return Column(
                      children: List<Text>.generate(listClientCommand.length,
                          (index) => Text(listClientCommand[index].toString())),
                    );
                  } catch (e) {
                    return Text(e.toString());
                  }

                  /*return listClientCommand.isEmpty
                      ? Row(
                          children: [
                            for (int i = 0; i < snapshot.data.docs.length; i++)
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
                        )
                      : Container();*/
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
