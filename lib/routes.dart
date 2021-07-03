import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth/views/clientdashboard/clientdashboard_view.dart';
import 'views/addclient/addclient_view.dart';
import 'views/command/command_view.dart';
import 'views/login/login_view.dart';
import 'views/home/home_view.dart';
import 'helpers/empty_view.dart';

/// [AppRouter]
/// This the base router classes where you can registered
/// and customize all the named routes of your app
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/command':
        return MaterialPageRoute(builder: (_) => CommandView());
      case '/addclient':
        return MaterialPageRoute(builder: (_) => AddClientView());
      case '/clientdashboard':
        return MaterialPageRoute(builder: (_) => ClientDashboardView());
      default:
        return MaterialPageRoute(builder: (_) {
          return EmptyView();
        });
    }
  }
}
