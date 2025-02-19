import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth/helpers/constants.dart';
import 'package:smooth/models/client.model.dart';
import 'package:smooth/views/clientdashboard/widgets/client_summary_card.widget.dart';
import '../base.view.dart';
import '../../viewmodels/clientdashboard.viewmodel.dart';

class ClientDashboardView extends StatefulWidget {
  ClientDashboardView({Key? key}) : super(key: key);

  @override
  _ClientDashboardViewState createState() => _ClientDashboardViewState();
}

class _ClientDashboardViewState extends State<ClientDashboardView> {
  @override
  Widget build(BuildContext context) => BaseView<ClientDashboardViewModel>(
        builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(kGlobalMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nos clients",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Gap(30),
                StreamBuilder(
                  stream: model.getClientAsStream(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) return ErrorWidget.withDetails();
                    if (!snapshot.hasData) {
                      return Center(
                          child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor));
                    } else {
                      List<Client> listClients = List<Client>.generate(
                        snapshot.data.docs.length,
                        (index) => Client.fromJson(
                          snapshot.data.docs[index].data()
                              as Map<String, dynamic>,
                        ),
                      );

                      return Column(
                        children: List<ClientSummaryCard>.generate(
                          snapshot.data.docs.length,
                          (index) => ClientSummaryCard(
                            client: listClients[index],
                            model: model,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.of(context).pushNamed('/addclient'),
            child: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      );
}
