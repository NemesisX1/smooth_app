import 'package:flutter/material.dart';
import 'package:smooth/helpers/constants.dart';
import 'package:smooth/viewmodels/home_viewmodel.dart';
import 'package:smooth/views/base_view.dart';
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
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          title: Text(
            "Smooth Bénin",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * (0.4),
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CityCard(),
                        CityCard(),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FlavourSummaryCard(
                            title: "Café Bilbao",
                            nbrSold: 140,
                            totalPrice: 375000,
                          ),
                          FlavourSummaryCard(
                            title: "Café Bilbao",
                            nbrSold: 140,
                            totalPrice: 375000,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  for (int i = 0; i < 50; i++)
                    ClientCard(
                      clientName: "Junior Medehou",
                      amount: 15000,
                      lastCommandDate: "25 Février 2015",
                    ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kRed,
          onPressed: () => Navigator.of(context).pushNamed('/command'),
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
    );
  }
}
