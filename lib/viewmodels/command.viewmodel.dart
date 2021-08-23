import 'package:flutter/material.dart';
import 'package:smooth/models/command.model.dart';

import 'base.viewmodel.dart';

class CommandViewModel extends BaseViewModel {
  Command currentCommand = Command();

  void updateCurrentCommand(Command newCommand) {
    currentCommand = newCommand;
    notifyListeners();
  }

  void validateCommand({VoidCallback? callback}) {
    callback!.call();
  }
}
