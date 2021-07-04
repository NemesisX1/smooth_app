import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth/helpers/constants.dart';
import 'package:smooth/views/clientdashboard/widgets/client_summary_card.dart';
import '../../viewmodels/clientdashboard_viewmodel.dart';
import '../../views/base_view.dart';

class ClientDashboardView extends StatefulWidget {
  ClientDashboardView({Key? key}) : super(key: key);

  @override
  _ClientDashboardViewState createState() => _ClientDashboardViewState();
}

class _ClientDashboardViewState extends State<ClientDashboardView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ClientDashboardViewModel>(
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
              ClientSummaryCard(),
              ClientSummaryCard(),
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
}
