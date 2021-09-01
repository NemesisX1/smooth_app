import 'package:flutter/painting.dart';
import 'package:smooth/models/flavour.model.dart';

/// App colors
const Color kGreen = Color(0xff146E18);
const Color kBrown = Color(0xff733904);
const Color kBlue = Color(0xff1266A5);
const Color kRed = Color(0xffE30045);

/// Global helpers
const double kGlobalMargin = 15;
const double kGlobalBorderRadius = 10;
const double kGlobalButtonHeigth = 45;

/// Information about the cities
const List<String> appCities = [
  "Cotonou",
  "Porto-Novo",
  "Calavi",
  "Parakou",
];

List<Flavour> flavoursList = [
  Flavour(
    name: "Bilbao (Café, Vanille)",
    price: 2000,
    shortName: 'Bao',
  ),
  Flavour(
    name: "Sweet Chery (Cerise, Casis)",
    price: 2500,
    shortName: 'S.Chery',
  ),
  Flavour(
    name: "Extra Pure Berry (Fraise)",
    price: 2000,
    shortName: 'P.Berry',
  ),
];
