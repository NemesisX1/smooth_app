import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth/main.dart';

import 'helpers/empty_view.dart';
import 'views/addclient/addclient.view.dart';
import 'views/command/command.view.dart';
import 'views/login/login.view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => LoginView());
      case TabManager.routeName:
        return MaterialPageRoute(builder: (_) => TabManager());
      case CommandView.routeName:
        return MaterialPageRoute(builder: (_) => CommandView());
      case AddClientView.routeName:
        return MaterialPageRoute(builder: (_) => AddClientView());
      default:
        return MaterialPageRoute(builder: (_) => EmptyView());
    }
  }
}
