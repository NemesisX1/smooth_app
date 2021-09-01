import 'package:provider/provider.dart';
import 'package:smooth/locator.dart';
import 'package:smooth/models/command.model.dart';
import 'package:smooth/services/firebase/firestore.service.dart';
import 'package:smooth/viewmodels/clientdashboard.viewmodel.dart';
import 'base.viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  FirestoreService _firestoreService = locator<FirestoreService>();

  /// In order to use the same functons used
  /// into the CommandViewModel
  ClientDashboardViewModel clientDashboardViewModel =
      ClientDashboardViewModel();
  Stream getCommandsAsStream() => _firestoreService.getCollectionAsStream(
        Collection.commands,
      );

  int getCountryAmount(List<Command> commands, String country) {
    List<Command> sublistClientCommand = commands
        .where(
          (element) => element.location == country,
        )
        .toList();

    int sum = 0;

    try {
      sum = List<int>.generate(
          sublistClientCommand.length,
          (index) =>
              sublistClientCommand[index].qty *
              sublistClientCommand[index].amount).reduce((a, b) => a + b);
    } catch (e) {}

    return sum;
  }

  int getFlavourAmount(List<Command> commands, String flavourName) {
    List<Command> sublistClientCommand = commands
        .where(
          (element) => element.flavourName == flavourName,
        )
        .toList();

    int sum = 0;

    try {
      sum = List<int>.generate(
          sublistClientCommand.length,
          (index) =>
              sublistClientCommand[index].qty *
              sublistClientCommand[index].amount).reduce((a, b) => a + b);
    } catch (e) {}

    return sum;
  }
}
