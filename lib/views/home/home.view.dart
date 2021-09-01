import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth/helpers/extensions.dart';
import 'package:smooth/helpers/constants.dart';
import 'package:smooth/models/client.model.dart';
import 'package:smooth/models/command.model.dart';
import 'package:smooth/viewmodels/home.viewmodel.dart';
import 'package:smooth/views/base.view.dart';
import 'package:smooth/views/home/widgets/city_card.dart';
import 'package:smooth/views/home/widgets/client_card.dart';
import 'package:smooth/views/home/widgets/flavour_summary_card.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) => BaseView<HomeViewModel>(
        builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
            child: StreamBuilder(
              stream: model.getCommandsAsStream(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) return ErrorWidget.withDetails();
                if (!snapshot.hasData) {
                  return CircularProgressIndicator(
                    color: Theme.of(context).accentColor,
                  );
                } else {
                  List<Command> commands = List<Command>.generate(
                      snapshot.data.docs.length,
                      (index) =>
                          Command.fromJson(snapshot.data.docs[index].data()));

                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * (0.4),
                        color: Theme.of(context).primaryColor,
                        child: Column(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List<CityCard>.generate(
                                  appCities.length,
                                  (index) => CityCard(
                                    cityName: appCities[index],
                                    amount: model.getCountryAmount(
                                      commands,
                                      appCities[index],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...List<FlavourSummaryCard>.generate(
                                    flavoursList.length,
                                    (index) => FlavourSummaryCard(
                                      title: flavoursList[index].name,
                                      nbrSold: model.clientDashboardViewModel
                                          .getFlavoursQty(
                                        commands,
                                        flavoursList[index].name!,
                                      ),
                                      totalPrice: model.getFlavourAmount(
                                        commands,
                                        flavoursList[index].name!,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      StreamBuilder(
                        stream:
                            model.clientDashboardViewModel.getClientAsStream(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasError) {
                            return ErrorWidget.withDetails();
                          }
                          if (!snapshot.hasData) {
                            return Column(
                              children: [
                                Gap(50),
                                CircularProgressIndicator(
                                  color: Theme.of(context).accentColor,
                                ),
                              ],
                            );
                          } else {
                            List<Client> listClients = List<Client>.generate(
                              snapshot.data.docs.length,
                              (index) => Client.fromJson(
                                snapshot.data.docs[index].data()
                                    as Map<String, dynamic>,
                              ),
                            );

                            return Column(
                              children: [
                                ...List<Widget>.generate(
                                  snapshot.data.docs.length,
                                  (index) => StreamBuilder(
                                      stream: model.clientDashboardViewModel
                                          .getCommandsAsStream(
                                        listClients[index].name!,
                                      ),
                                      builder:
                                          (context, AsyncSnapshot snapshot) {
                                        if (snapshot.hasError) {
                                          return ErrorWidget.withDetails();
                                        }
                                        if (snapshot.hasData) {
                                          List<Command> commands =
                                              List<Command>.generate(
                                                  snapshot.data.docs.length,
                                                  (index) => Command.fromJson(
                                                      snapshot.data.docs[index]
                                                          .data()));

                                          return ClientCard(
                                            clientName: listClients[index].name,
                                            amount: model
                                                .clientDashboardViewModel
                                                .getTotalAmout(commands),
                                            lastCommandDate: listClients[index]
                                                .birthday!
                                                .toSimpleFormat(),
                                          );
                                        } else {
                                          return Container();
                                        }
                                      }),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.of(context).pushNamed('/command'),
            child: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      );
}
