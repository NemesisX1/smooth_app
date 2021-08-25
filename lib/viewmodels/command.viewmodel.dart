import 'package:flutter/material.dart';
import 'package:smooth/helpers/enums.dart';
import 'package:smooth/locator.dart';
import 'package:smooth/models/client.model.dart';
import 'package:smooth/models/command.model.dart';
import 'package:smooth/services/firebase/firestore.service.dart';

import 'base.viewmodel.dart';

class CommandViewModel extends BaseViewModel {
  Command currentCommand = Command();
  FirestoreService _firestoreService = locator<FirestoreService>();

  void updateCurrentCommand(Command newCommand) {
    currentCommand = newCommand;
    notifyListeners();
  }

  void validateCommand({VoidCallback? callback}) async {
    setState(ViewState.Busy);

    await _firestoreService.addModelToCollection(
        currentCommand, Collection.commands);
    setState(ViewState.Idle);
    callback!.call();
  }

  Future<List<Client>> getClientList() async {
    late List<Client> clients;

    setState(ViewState.Busy);
    await _firestoreService.getCollection(Collection.clients).then((value) {
      clients = List<Client>.generate(
          value.docs.length,
          (index) => Client.fromJson(
              value.docs[index].data() as Map<String, dynamic>));
    });
    return clients;
  }
}
