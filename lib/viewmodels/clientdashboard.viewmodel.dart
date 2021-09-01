import 'package:smooth/locator.dart';
import 'package:smooth/models/command.model.dart';
import 'package:smooth/services/firebase/firestore.service.dart';
import 'package:smooth/viewmodels/base.viewmodel.dart';

class ClientDashboardViewModel extends BaseViewModel {
  FirestoreService _firestoreService = locator<FirestoreService>();

  Stream getClientAsStream() =>
      _firestoreService.getCollectionAsStream(Collection.clients);

  Stream getCommandsAsStream(String clientName) =>
      _firestoreService.getCollectionByTagAsStream(
        Collection.commands,
        'clientName',
        clientName,
      );

  /// Functions to handle local data for the
  /// client summary widget

  int getTotalAmout(List<Command> commands) {
    int clientTotalAmount = List<int>.generate(commands.length,
            (index) => commands[index].amount * commands[index].qty)
        .reduce((a, b) => a + b);

    return clientTotalAmount;
  }

  int getFlavoursQty(List<Command> commands, String flavourName) {
    List<Command> sublistClientCommand = commands
        .where(
          (element) => element.flavourName == flavourName,
        )
        .toList();
    int sum = 0;

    try {
      sum = List<int>.generate(sublistClientCommand.length,
          (index) => sublistClientCommand[index].qty).reduce((a, b) => a + b);
    } catch (e) {}
    return sum;
  }
}
